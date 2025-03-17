

## What is a OIDC Connector?

ALB controller is a pod  that is deployed and running in our eks cluster, and it will create a LB in AWS. How does a pod achieve this functionality?

As u know, if you want to create any resource in AWS, u need to assign a IAM role to service, or if u are a IAM user, u need to attach policies to user , and then only u can create resource in AWS.

So how pod within EKS cluster which has a service account is able to create a Load balancer? Its only possible if SA is binded to IAM role somehow.

Every pod has a service account, we wil create a iam role , assign policy with required permission to IAM role, and then connect the SA to iam, this binding is connected by IAM OIDC Provider. We will need to install this OIDC Provider as a prerequisite 

## Setup

Follow - https://github.com/iam-veeramalla/ultimate-devops-project-aws/blob/main/14-kubernetes-ingress-controller.md

1. we need to expose the cluster - `export cluster_name=my-eks-cluster`

2 - commands to configure IAM OIDC provider

 `oidc_id=$(aws eks describe-cluster --name $cluster_name --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5) `

```
echo $oidc_id
4D336C17AB82472DAA930BC641BBA145

```

3. We will run the below command. This will associate iam-oidc-provider with our cluster

`export AWS_REGION=us-east-1`  # Replace with your preferred region
`eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve`

```
eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve
2025-03-17 12:27:39 [ℹ]  will create IAM Open ID Connect provider for cluster "my-eks-cluster" in "us-east-1"
2025-03-17 12:27:39 [✔]  created IAM Open ID Connect provider for cluster "my-eks-cluster" in "us-east-1"
```

Now the service account associated with ALB pod is able to communicate with IAM OIDC role. Now we need to create the SA, IAM Role, and policy.

1. So firstly, we will create a policy, which will have permission related to ELB
2. Create IAM role and attach it to SA of ALB controller


Download policy - `curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json`

This will download  iam_policy.json , which will have all the permissions related to ALB. We will create this policy on AWS using - 

`aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json`


Now we will assign IAM role to SA

`eksctl create iamserviceaccount \
  --cluster=my-eks-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::975050301329:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve`

```
2025-03-17 12:33:47 [ℹ]  1 iamserviceaccount (kube-system/aws-load-balancer-controller) was included (based on the include/exclude rules)
2025-03-17 12:33:47 [!]  serviceaccounts that exist in Kubernetes will be excluded, use --override-existing-serviceaccounts to override
2025-03-17 12:33:47 [ℹ]  1 task: { 
    2 sequential sub-tasks: { 
        create IAM role for serviceaccount "kube-system/aws-load-balancer-controller",
        create serviceaccount "kube-system/aws-load-balancer-controller",
    } }2025-03-17 12:33:47 [ℹ]  building iamserviceaccount stack "eksctl-my-eks-cluster-addon-iamserviceaccount-kube-system-aws-load-balancer-controller"
2025-03-17 12:33:48 [ℹ]  deploying stack "eksctl-my-eks-cluster-addon-iamserviceaccount-kube-system-aws-load-balancer-controller"
2025-03-17 12:33:48 [ℹ]  waiting for CloudFormation stack "eksctl-my-eks-cluster-addon-iamserviceaccount-kube-system-aws-load-balancer-controller"
2025-03-17 12:34:18 [ℹ]  waiting for CloudFormation stack "eksctl-my-eks-cluster-addon-iamserviceaccount-kube-system-aws-load-balancer-controller"
2025-03-17 12:34:18 [ℹ]  created serviceaccount "kube-system/aws-load-balancer-controller"
```

## Download ALB controller using Helm chart

`curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3`
`chmod 700 get_helm.sh`
`./get_helm.sh`

We will add eks repo

`helm repo add eks https://aws.github.io/eks-charts`

Next we will run command to install ALB controller

`helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=my-eks-cluster --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller --set region=us-east-1 --set vpcId=vpc-03d874376be35a79a`

```
NAME: aws-load-balancer-controller
LAST DEPLOYED: Mon Mar 17 12:40:34 2025
NAMESPACE: kube-system
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
AWS Load Balancer controller installed!

```

Once this is done, we need to verify whether our alb pods are up and running.

```
 kubectl get pods -n kube-system
NAME                                           READY   STATUS    RESTARTS   AGE
aws-load-balancer-controller-dbbc59f87-htgmt   1/1     Running   0          57s
aws-load-balancer-controller-dbbc59f87-jnjl6   1/1     Running   0          57s
aws-node-s5m62                                 2/2     Running   0          4h48m
aws-node-vwqkl                                 2/2     Running   0          4h48m
coredns-586b798467-2pq77                       1/1     Running   0          4h49m
coredns-586b798467-2qqb5                       1/1     Running   0          4h49m
kube-proxy-pdflv                               1/1     Running   0          4h48m
kube-proxy-ss7kj                               1/1     Running   0          4h48m
```

We can also check logs of ALB using `kubectl logs aws-load-balancer-controller-dbbc59f87-htgmt -n kube-system`, if there is no error, then it means ALB controller installation is success.

