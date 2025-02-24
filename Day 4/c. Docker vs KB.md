

## Service Discovery

One of the major problem with containers is this -->

Containers are ephemeral in nature, and suppose a ms pod, for eg, ad ms goes down, and we have a restart policy attached with pod. Now when it comes up again, it will have a new IP, and so the ms communicating with it will not be able to communicate it because of a new IP assigned to pod.

KB solves this problem.

## Other problem with containers

If you want to deploy these containers to prod, we want

1. HA
2. Load Balancing
3. Integration with API gateway

For all of this we need a container orchestration engine, KB being one.


## Docker compose vs KB

docker compose up and down simplifies the docker lifecycle by incorporating all the build details in one and helps to run/stop multiple containers at once.

KB is a container orchestration platform, and addresses critical problems like service discovery, clustering, HA, load balancing and a lot of other things.