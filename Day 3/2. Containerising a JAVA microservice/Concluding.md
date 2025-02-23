
## Building the docker file

docker build -t adminnik/adservice:v1 .
2025/02/23 13:37:16 in: []string{}
2025/02/23 13:37:16 Parsed entitlements: []
[+] Building 89.5s (21/21) FINISHED                                                                          

## Image
We can see our docker image is build.

```
docker images
REPOSITORY           TAG       IMAGE ID       CREATED          SIZE
adminnik/adservice   v1        be0a80c4ab46   11 minutes ago   338MB
hello-world          latest    74cc54e27dc4   4 weeks ago      10.1kB

```

## Run the image

If we run our dockre image, we can see the ms is giving O/P

```
ubuntu@ip-172-31-32-237:~/ultimate-devops-project-demo/src/ad$ docker run adminnik/adservice:v1
2025-02-23 13:51:41 - oteldemo.AdService - Ad service starting. trace_id= span_id= trace_flags= 
SLF4J(W): No SLF4J providers were found.
SLF4J(W): Defaulting to no-operation (NOP) logger implementation
SLF4J(W): See https://www.slf4j.org/codes.html#noProviders for further details.
2025-02-23 13:51:42 - oteldemo.AdService - Ad service started, listening on 8080 trace_id= span_id= trace_flags= 

```