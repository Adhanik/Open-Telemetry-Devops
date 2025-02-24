
We will create a yaml file, within which we will have 3 most imp and primary parent objects.

1. Services

In the services section, we will define section for each ms, how we will pull/run the docker image

```

services:
  Ad:
    image: <image name>  ## will directly run the image or pull if not available 
    build:
      Dockerfile  ## if you want to build your image
    deploy: ## in this section you can mention the resources that this container is going to use
    ports:
    environment: ## where we define env variables
    depends_on: # this parameters tell the ms Ad is dependent on
      - recommendation ## so docker will start recommendation ms first, and then it will run the Ad ms

```

2. Networks

Here we will define network, which will create network for all the ms and these ms will then connect using to each other using this network.

```
networks:
  default:
    name: opentelemetry-demo
    driver: bridge
```

The only thing that will change when you write a docker compose is name of network, and type of network. It can be bridge network, host network or anything else.

3. Volumes 


If any container needs a particular volume , we will define how to create those volume as well for it.


## Command commands

`docker compose up` - Start all the containers with logs
`docker compose up -d` - Run the containers in background without seeing logs
`docker compose down` - Stop all the containers