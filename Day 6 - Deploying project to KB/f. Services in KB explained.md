

We have 3 Services in KB

1. clUSTER Ip
2. Node Port
3. Load balancer

## Accessing ms within the VPC 
Our current ms consist of all the cluster ip. Using CNI a internal network is created. This internal network is accessible only by the pods inside kb cluster. For eg, 2 pods on a node can communicate with each other, but a EC2 or lambda from outside cannot access service inside KB, because by default the service type is Cluster IP and hence  KB follows its own networking

Cluster ip only allows service to service communication within cluster, and pod to pod communication within cluster. It is commonly used when you dont want to expose your ms outside the cluster.

For ec2 to connect to your service which in turns forward request to pod inside KB cluster, we can do this using `Node Port` service type. KB assigns a specific port on which that app will be available, and you can access that using <node-IP>:<port> Internally kube proxy is updating the iP tables here

## Accessing ms from internet

To access the pod from outside world, we can change the service type to load balancer

When we expose our ms using LB, api controller communicates with the cloud controller manager (ccm), and it will provision a LB with external IP address.