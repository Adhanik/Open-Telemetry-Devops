

As devops engineer, we worked on containerizing the 3 ms in our Day3, which were product, ad and recommendation ms.

We pushed the images to dockerhub registry, and now qa can pull these images, and run them using docker run command and verify whether changes made by dev are correct or not.

## The problem

The QA engineer says that he needs to run 5 commands for each ms to start, build and run the container. so a toal of around 15-20 commands to have all services running. 


- First he needs to create a docker network, so that he can put all ms in same network and then only can the containers talk to each other.

- He also needs to create volume, for eg if there is DB ms.
- pull the container images
- Run the container images in specific order, for eg, first DB, then product, then ad, then recommendation service.

#### Without Docker Compose:
```bash
docker build -t myapp .
docker run -d --name myapp-container -p 8080:8080 myapp
docker run -d --name db-container -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=password -e POSTGRES_DB=mydatabase postgres:13
docker run -d --name nginx-container -p 80:80 nginx
```


So can we do something, by which on running one command all the above configurations set up automatically??
Here we use Docker compose. The docker-compose.yaml file will consist of all the steps to run the container/env.


#### With Docker Compose:
```bash
docker-compose up
```