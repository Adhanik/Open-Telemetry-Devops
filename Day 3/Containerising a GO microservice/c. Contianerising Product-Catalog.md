
We will go to product-catalog ms, delete the existing docker file and the binary we build locally, and start writing our Docker file

1. Since we are working with a GO ms, we will use a golang as base image. 
2. We will use Multi stage build
3. We will copy the source code into our Docker file
4. We will download the binaries from go.mod (## in go there is file called go.mod. we will download the binaries from go.mod by running go mod download)
5. We will copy the binary in second stage from the workdir path we have mentioned in first path - /usr/src/app 

6. Run - docker build -t adminnik/productcatalog:v1 .

```
docker images
REPOSITORY                TAG       IMAGE ID       CREATED          SIZE
adminnik/productcatalog   v1        e991d070e7ab   20 seconds ago   37MB
hello-world               latest    74cc54e27dc4   4 weeks ago      10.1kB

```

7. validate if the created Docker image is right by running the docker run command

docker run adminnik/productcatalog:v1

```
docker run adminnik/productcatalog:v1
time="2025-02-19T20:05:54Z" level=info msg="Loaded 10 products"
time="2025-02-19T20:05:54Z" level=fatal msg="Environment Variable Not Set: \"PRODUCT_CATALOG_PORT\""

```

We get this error

8. We will add env variable as port 8080
9. We can build the image again - docker build -t adminnik/productcatalog:v2 .

10. Now we run - `docker run adminnik/productcatalog:v2`

time="2025-02-19T20:10:24Z" level=info msg="Loaded 10 products"
time="2025-02-19T20:10:24Z" level=info msg="Product Catalog gRPC server started on port: 8080"
