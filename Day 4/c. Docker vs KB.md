

## Service Discovery

One of the major problem with containers is this -->

Containers are ephemeral in nature, and suppose a ms pod, for eg, ad ms goes down, and we have a restart policy attached with pod. Now when it comes up again, it will have a new IP, and so the ms communicating with it will not be able to communicate it because of a new IP assigned to pod