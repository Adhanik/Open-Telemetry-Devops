

With this initial version of Dockerfile, we are getting this error 

```
FROM ubuntu:latest AS build 

WORKDIR /app/usr/bin 

COPY . .  

RUN sdk install gradle 8.12.1

RUN ./gradlew installDist


FROM alpine as release 

COPY --from=build /app/usr/bin . 

EXPOSE ${AD_PORT}
ENV AD_PORT=8080

ENTRYPOINT ["./build/install/opentelemetry-demo-ad/bin/Ad"]
```

```
 => ERROR [build 4/5] RUN sdk install gradle 8.12.1                                                                                                   0.2s
------                                                                                                                                                     
 > [build 4/5] RUN sdk install gradle 8.12.1:
0.213 /bin/sh: 1: sdk: not found
------

 1 warning found (use docker --debug to expand):
 - FromAsCasing: 'as' and 'FROM' keywords' casing do not match (line 12)
Dockerfile:7
--------------------
   5 |     COPY . .  
   6 |     
   7 | >>> RUN sdk install gradle 8.12.1
   8 |     
   9 |     RUN ./gradlew installDist
--------------------
ERROR: failed to solve: process "/bin/sh -c sdk install gradle 8.12.1" did not complete successfully: exit code: 127
exit status 1

```