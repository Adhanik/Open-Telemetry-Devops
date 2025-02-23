
1. For java based ms, we are using eclipse as base image instead of ubuntu which we used.
2. WORKDIR  /usr/src/app/, tells this is the dir from where all the next instructions in Dockerfile will be executed.

3. We will copy the files needed from local inside Dockerfile, and then run gradle download command. Then we can download all dependencies and perform build process.

We will also copy the gradle folder from local to inside gradle repo

4. to download dependecny we will run the gradle wrapper, but the docker file should have execute permission. So we give permission using chmod +x

So instead of doing all in one single step using - ./gradlew installDist, we are first downloading the dependencies, and then we will proceed with build process which will create multiple layers for us. So we are also separating layers everytime this Dockerfile is build which will help in caching as well. 

5. Now since all dependencies are downloaded, we will copy source code to Dockerfile, and also copy the proto file.

COPY ./pb ./proto  (./pb is on local, which will be copied to folder ./proto inside docker)

6. We will provide execute permission once again just in case, and then run the command given by developer to run gradle wrapper

7. After this we can directly provide the ENTRYPOINT, with the command to run the ms, but we will make use of multi stage docker file. we will take the binary build in first stage, and copy it to final stage. that way we will not have dependencies in next stage. As image becomes light, there are less chance of vulnebralities. 

8. With java we cannot use a alpine image, as we need to have java runtime in order to build a java.var file. for go, we have self contained binary, which means we can take go binary, and run on machine even where go is not installed. This is because go binaries are self contained libraries

If you still want to use alpine, you need to install JRE using apt or curl. So instead, we will find a lightweight image which already has a JRE, but not jdk. in previous stage we use image which had JDK, which is heavy image and we additionaly downloaded a bunch of dependencies on top of that image that are required to build this application

9. Lastly we provide the port in Env AND give the command in ENTRYPOINT to run when container starts.
