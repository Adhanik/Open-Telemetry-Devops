
## Prerequisite

To create EKS cluster, we need to create two IAM roles, where one IAM role is for cluster(control plane node), and the other is for worker nodes.

- Once the roles for control plane node is created, we need to attach policy to this role as well. Once policies are attached to this role, the role will get the permission. Then we will create our EKS control plane/master node

- Next, we need to create IAM role for our worker nodes as well. we will create a  policy with necessary permission, attach that to IAM role that we have created for nodes, 

- create `NODE GROUP`, and attach node group to EKS cluster.

