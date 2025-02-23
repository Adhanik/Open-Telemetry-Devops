
We will pick ms writtein in Go, Java and python and start containerising them


1. Go - ms written in go are Product Catalog Service, Checkout Service
2. Java - Ad Service
3. Python - Recommendation Service


## Product Catalog Service

1. Go to src -> Product catalog service - readme.md
2. We will try to execute the source steps on our local EC2 first

```
ubuntu@ip-172-31-37-126:~/ultimate-devops-project-demo$ cd src/product-catalog/
ubuntu@ip-172-31-37-126:~/ultimate-devops-project-demo/src/product-catalog$ ls
Dockerfile  README.md  genproto  go.mod  go.sum  main.go  products  tools.go

```

3. We will follow the instruction provided in README.md to run this product catalog ms
Follow - https://github.com/iam-veeramalla/ultimate-devops-project-demo/tree/main/src/product-catalog

`export PRODUCT_CATALOG_PORT=8088`
Download go - `sudo apt install golang-go`
`go build -o product-catalog . `  - This build command will download all the dependencies. It will create a build with binary name being product-catalog and -o stands for destination.


### Note - Dependency files 
Every programming language, has a depenedency file, for eg in python, we have requirements.txt, for java, if you are using maven, we have pom.xml, and if using Gradle, we have gradle files. Similarly for gradle, we have go.mod. Developers mention all these dependencies. 


## Build O/P

We can see that our build binary file is created. 

```
ls -ltr
total 28740
-rw-rw-r-- 1 ubuntu ubuntu      518 Feb 19 16:35 tools.go
drwxrwxr-x 2 ubuntu ubuntu     4096 Feb 19 16:35 products
-rw-rw-r-- 1 ubuntu ubuntu     8741 Feb 19 16:35 main.go
-rw-rw-r-- 1 ubuntu ubuntu    21347 Feb 19 16:35 go.sum
-rw-rw-r-- 1 ubuntu ubuntu     3815 Feb 19 16:35 go.mod
drwxrwxr-x 3 ubuntu ubuntu     4096 Feb 19 16:35 genproto
-rw-rw-r-- 1 ubuntu ubuntu      670 Feb 19 16:35 README.md
-rw-rw-r-- 1 ubuntu ubuntu      606 Feb 19 16:35 Dockerfile
-rwxrwxr-x 1 ubuntu ubuntu 29366641 Feb 19 16:49 product-catalog
```

If we run this build, we can see it gets started on specified port.

```
./product-catalog 
INFO[0000] Loaded 10 products                           
INFO[0000] Product Catalog gRPC server started on port: 8088 

```