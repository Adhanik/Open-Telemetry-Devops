
## Why Deployment is needed?

Docker containers are ephemeral in nature, and if anytime the container goes down and comes up, the IP address of the container is going to change. Hence KB is widely used due to these 2 features -

A pod is smalles ojbect in KB, much alike container in Docker, but POD can consist of multiple contianers as well. The pod consists of all the ms, since these containers can go down, hence KB asks user to make use of resource called Deployment and deployment resource will handle your pod. Deployment creates Replica set, and this replica set spins up your Pods


1. Scaling and Healing
2. Service Discovery - Taken care by services

Suppose a docker container went down, and by default, you have not set any restart policy for container, so contaienr wont come up. This means there is no auto healing for containers. 

Also, during peak time, you would want HA of your contianers, so u would need multiple copies of ur contianer, and you would additionally need a LOAD BALANCER balancing the load, so scaling is necessary.

To address the above features, KB provides us with a feature which is known as Deployment. Deployment is a imp resource of KB that takes care of Healing (bringing containers back up) and scaling when there is huge traffic

#### How Replica set acts as Controller and does Auto healing and scaling

Replica set makes sure that a specified no of pods are always up and running. if any pod goes down, it makes sure to bring another pod up asap. This solves the problem of `auto healing` for us. so replica set acts as controller in KB, and deployment creates this rs controller which is responsible for scaling and healing.

Hence its better than Docker

- no	- Don't automatically restart the container. (Default)
- on-failure[:max-retries]-	Restart the container if it exits due to an error, which manifests as a non-zero exit code. 
- always -	Always restart the container if it stops. If it's manually stopped, it's restarted only when Docker daemon restarts or the container itself is manually restarted. (See the second bullet listed in restart policy details)
- unless-stopped -	Similar to always, except that when the container is stopped (manually or otherwise), it isn't restarted even after Docker daemon restarts.
