

Suppose you are given task to containerise a completely new programming language eg Rust . For this we can make use of Docker init, which can write Dockerfiles for us.


Note - Docker init does not work on your EC2 instance, as docker init only comes with docker desktop. Its necessary to have docker desktop installed. 


## Using docker init

On your mac, if docker desktop is installed, run command `docker init`

This will ask you for some parameters and build your docker file 

## Push the image

To make docker image accessible to all, we push them to common docker hub repostiores or Artifactories. Eg, ECR, docker hub.

To push images to this container registry, we use below commands. Here docker.io is the container registry where we are trying to push.

`docker login docker.io`

then push using `docker push adminnik/adservice:v1`
The above push command is same as `docker push docker.io/adminnik/adservice:v1`


- docker.io = Registy, this is generally left out, because by default docker assumes you are pushing to docker hub only
- adminnik = is username
- adservice = is repo name within docker hub. if not available it creates the repo name first, then push v2 version of it.