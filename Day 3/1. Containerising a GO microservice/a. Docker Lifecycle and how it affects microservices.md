

## How do you implement docker lifecycle on microservices?

We have more than 20 ms in our Open Telemetry application on which we are working rn. When working for an org, you will not be working on all the ms, the ms are divided and categorised into multiple dev teams.

At amozon, for eg, we will have a team taking care of payment and transaction ms, andother takes care of UI, backend, DB etc. So we might work with 1-2 dev team


First thing we do is containerise these microservices, and for this we need Docker. Suppose you are told to containerise payment ms. 

We implement this using Docker lifecycle

## Docker Life cycle

1. Setup Docker file
2. Create Docker Image   - docker build command 
3. Create and Run Docker container   - docker run command

We need to know how dev is building the applications in his local machine and this info is shared to Devops Engineer. Generally the instruction to build are written in readme file along with env variables that are needed.
