
## Prerequisite

To create EKS cluster, we need to create two IAM roles, where one IAM role is for cluster(control plane node), and the other is for worker nodes.

- Once the roles for control plane node is created, we need to attach policy to this role as well. Once policies are attached to this role, the role will get the permission. Then we will create our EKS control plane/master node

- Next, we need to create IAM role for our worker nodes as well. we will create a  policy with necessary permission, attach that to IAM role that we have created for nodes, 

- create `NODE GROUP`, and attach node group to EKS cluster.

## During writing main.tf for EKS

- So we created the IAM cluster role, attached policies to it. next we will create EKS cluster

- while creating the resource "aws_eks_cluster" "main" {}, you need to assign the cluster role that you have created in first step, eg - > role_arn = aws_iam_role.cluster.arn 

- depends_on makes sure that IAM role is created first, and then we proceed for resource "aws_eks_cluster" to be created.