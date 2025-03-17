
## How to access the EKS cluster from EC2

```
Outputs:

cluster_endpoint = "https://D7F56FC669C8F0015736C5E49A84FB07.gr7.us-east-1.eks.amazonaws.com"
cluster_name = "my-eks-cluster"
vpc_id = "vpc-09545dd46fe232596"
```

We will create a EC2 machine again, where we have docker, kubectl and terraform installed.
We will also install aws cli, aws-configure


## Accessing KB

If we log into our EC2 machine, and run - `kubectl get nodes`, it will not show you the eks cluster that you created. This is because kubectl does not know by default what is our cluster.

kubectl depends on a file called `kubeconfig`.

kubeconfig file consists of list of clusters if there are in your organisation, or list of cluster that you want to connect to. Since there are multiple cluster, there is context , which tells kubectl about the cluster its connected to currently.


Uisng context kubectl is able to understand which cluster its currently connected to.

## Common commans

- `kubectl config view`
```
kubectl config view
apiVersion: v1
clusters: null
contexts: null
current-context: ""
kind: Config
preferences: {}
users: null

```
- `kubectl config current-context`  ## used to know which cluster is kubectl currently connected to
- `kubectl config use-context <name of context>`  ## switch to another cluster context


## How to update the kubeconfig file to your current EKS cluster

Prerequisite - Ensure you have aws cli installed.

-  `sudo apt install unzip -y`
- `sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install`

- `aws configure`  ## add them from cd .aws/credentials

- Install eksctl

# Example for Linux with a specific version
```

curl -sLO "https://github.com/weaveworks/eksctl/releases/download/v0.156.0/eksctl_Linux_amd64.tar.gz"
tar -xzf eksctl_Linux_amd64.tar.gz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
```

To update kube config, we will run - `aws eks update-kubeconfig --region region-code --name <name of eks cluster>`

`aws eks update-kubeconfig --region us-east-1 --name my-eks-cluster`

O/P
Added new context arn:aws:eks:us-east-1:975050301329:cluster/my-eks-cluster to /home/ubuntu/.kube/config

Now if you run `kubectl config view`, we can see all details about our EKS cluster

We can see current context using - 

```
kubectl config current-context
arn:aws:eks:us-east-1:975050301329:cluster/my-eks-cluster
ubuntu@ip-172-31-93-146:~$ 

```


## Accessing nodes

Now i can see that we have foll nodes

```
 kubectl get nodes
NAME                         STATUS   ROLES    AGE   VERSION
ip-10-0-1-135.ec2.internal   Ready    <none>   24m   v1.30.9-eks-5d632ec
ip-10-0-2-27.ec2.internal    Ready    <none>   25m   v1.30.9-eks-5d632ec
```


Our kubectl is now connected to our EKS cluster