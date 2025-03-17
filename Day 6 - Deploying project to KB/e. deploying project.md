
## Prerequistie

1. Launch a EC2, install docker, kubectl on it, git on it.

`sudo apt-get install git`
`sudo apt-get install unzip`
Install aws cli 
`curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install`

`aws-configure`

2. Clone into your EC2-  https://github.com/iam-veeramalla/ultimate-devops-project-demo.git

Create infro from TF
cluster_endpoint = "https://4D336C17AB82472DAA930BC641BBA145.gr7.us-east-1.eks.amazonaws.com"
cluster_name = "my-eks-cluster"
vpc_id = "vpc-03d874376be35a79a"

`aws eks update-kubeconfig --region us-east-1 --name my-eks-cluster`

## Implementation

Navigate to - cd Ulti \ kuberentes
First check our kb current context - 

```
 kubectl config current-context
arn:aws:eks:us-east-1:975050301329:cluster/my-eks-cluster

```
```
kubectl get all
NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   172.20.0.1   <none>        443/TCP   34m

```

3. We will create a service account first, as we will not be using the default service account.
After running `kubectl apply -f serviceaccount.yaml`

```
kubectl get sa
NAME                 SECRETS   AGE
default              0         52m
opentelemetry-demo   0         44s

```

#### How one service is connected to other ?

If shipping has to connect to Quote service, in the env variables of shipping pod, we have service name of quote service, and with service discovery it will connect qoute to shipping service. 

This happens either through config maps or env variables


In shipping service we can see
env:

      - name: QUOTE_SERVICE_ADDR
              value: http://opentelemetry-demo-quoteservice:8080

We have the opentelemetry-demo Service account set for each deployment


We are not able to access our ms frontend using the IP address, we were not able to do so since it was assigned a ClusterIP

```
kubectl get svc | grep frontendproxy
opentelemetry-demo-frontendproxy           ClusterIP   172.20.169.185   <none>        8080/TCP            9m25s
```

If i try to do 172.20.169.185:8080 on my browser, it is not able to access since its inside my EKS cluster which is in private subnet. To access this from exteranl network, we can make use of another service

To access the project from outside, we have to expose it using a diff KB service.
