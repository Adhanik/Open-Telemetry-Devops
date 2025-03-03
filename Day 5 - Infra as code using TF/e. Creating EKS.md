
## Prerequisite

To create EKS cluster, we need to create two IAM roles, where one IAM role is for cluster(control plane node), and the other is for worker nodes.

- Once the roles for control plane node is created, we need to attach policy to this role as well. Once policies are attached to this role, the role will get the permission. Then we will create our EKS control plane/master node

- Next, we need to create IAM role for our worker nodes as well. we will create a  policy with necessary permission, attach that to IAM role that we have created for nodes, 

- create `NODE GROUP`, and attach node group to EKS cluster.

## During writing main.tf for EKS

- So we created the IAM cluster role, attached policies -`AmazonEKSClusterPolicy` to it. next we will create EKS cluster

- while creating the resource "aws_eks_cluster" "main" {}, you need to assign the cluster role that you have created in first step, eg - > role_arn = aws_iam_role.cluster.arn 

- depends_on makes sure that IAM role is created first, and then we proceed for resource "aws_eks_cluster" to be created.


## IAM role creation for worker nodes

- Do you want to have your worker nodes as fargate or EC2 instances. We will do with EC2 nodes here. IAM role will assume role which will have access to EC2 service. 

- Next we will attach role policies. the worker nodes will add more permissions like AmazonEKSWorkerNodePolicy, AmazonEKS_CNI_Policy, and AmazonEC2ContainerRegistryReadOnly

- Finally we will create the EC2 Node instance group. since we will have multiple worker nodes, we need a for_each loop . We hve defined variable "node_groups"

- since we have autoscaling gropus defined in our worker node resource definition, we need to mention max and min no of worker nodes in variable "node_groups". This will also depend on first the IAM role being created

- for EKS , we want to see the cluster endpoint and cluster name, which we will extract in output.tf


Now we have completed writing the modules for EKS and VPC. We will invoke the VPC and EKS function module code using main.tf