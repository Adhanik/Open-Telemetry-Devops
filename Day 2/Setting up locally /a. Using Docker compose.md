
## Why use Docker compose

We are working with a E-Commerce project where we have Frontend, Backend, and DB, the preferred approach to run such projects is Docker Compose as docker compose can run multiple containers at once, and it can also establish dependencies btw the containers.

For eg, you can specify DB container to start first, and then backend container should start, and then frontend.

Docker compose supports the full lifecycle of docker containers, 

- Build the image
- run the containers
- create network
- create volumes

Hence docker compose is preferred to run the projects locally.

### Challenges with Traditional Docker Commands

1. **Managing Lifecycle and Dependencies**:
   - With traditional Docker commands (like `docker build` and `docker run`), you have to manually ensure that services are started in the correct order. For example, if you run the payment service before the database service is ready, it can lead to errors or failures.

2. **Multiple Commands**:
   - Running many `docker build` and `docker run` commands can be cumbersome and error-prone. Each microservice might require its own build and run command, leading to a complex process for developers.

3. **Local Development**:
   - For developers testing on their local machines, manually managing multiple containers and ensuring they are built and started correctly can be tedious. Sharing the setup process with others can also be challenging, as each developer needs to replicate the environment and run the same commands repeatedly.

### Solution: Docker Compose

We can overcome these problems using **Docker Compose**, which is a tool designed to simplify the management of multi-container Docker applications. Here’s how it helps:

- Docker Compose allows services to depend on each other using the `depends_on` key. This ensures that services are started in the correct order.
- Instead of using multiple commands to build and run containers, Docker Compose allows you to manage everything with a single command.

#### Without Docker Compose:
```bash
docker build -t myapp .
docker run -d --name myapp-container -p 8080:8080 myapp
docker run -d --name db-container -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=password -e POSTGRES_DB=mydatabase postgres:13
docker run -d --name nginx-container -p 80:80 nginx
```

#### With Docker Compose:
```bash
docker-compose up
```
**Explanation**:
- **Build and run**: Automatically builds and starts all services (`web`, `app`, `db`) defined in the `docker-compose.yml` file.
- **Stop and remove**: `docker-compose down` cleans up all resources with a single command.


## Set up docker compopse

Login to your EC2 Node, clone https://github.com/iam-veeramalla/ultimate-devops-project-demo.git , 

`cd ultimate-devops-project-demo/`