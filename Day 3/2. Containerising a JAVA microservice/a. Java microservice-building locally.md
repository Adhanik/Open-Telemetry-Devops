
In this section, we will containerise our Java ms. 

Go to src folder, in which we have ad mircoservice written in JAVA. We will containerise this ms

## Reading Instructions provided by developer

We will read the instruction provided in Readme.md file 

1. We can see that this ad ms is built using gradle
2. So we have this gradlew which  is used to execute Gradle tasks on Unix-based systems without needing to manually install Gradle. This script will start gradle demon and takes care of downloading dependencies and compiling the program and build the application.

For windows, we have gradle.bat (batch file) also available.

Note - Maven is based on a POM file and is well-suited for smaller projects, while Gradle is more expressive and customizable, making it better suited for larger and more complex projects. Additionally, Gradle's faster build times and support for incremental builds make it a better choice for Spring Boot projects.

3. We will check if java is installed in our machine or not, using java --version. if you found - Command 'java' not found, then it can be installed with: `sudo apt install openjdk-21-jre-headless`

4. We will run `./gradlew` to run the gradle wrapper. If you dont have permission, run `chmod +x ./gradlew` to give executable permission.

5. Next we will run `./gradlew installDist` which will run gradle daemon, install dependencies, perform compilation, and then build the application. The build app is saved in a particular dir, which is also provided by developer. It will create an executable script src/ad/build/install/oteldemo/bin/Ad. where the build and jar file is kept

We will check using ls -ltr ./build/install/opentelemetry-demo-ad/bin/Ad

```
ubuntu@ip-172-31-32-237:~/ultimate-devops-project-demo/src/ad$ ls -ltr ./build/install/opentelemetry-demo-ad/bin/Ad
-rwxr-xr-x 1 ubuntu ubuntu 11498 Feb 23 12:02 ./build/install/opentelemetry-demo-ad/bin/Ad
ubuntu@ip-172-31-32-237:~/ultimate-devops-project-demo/src/ad$ 

```

We can see we have the executable file (Ad) and the batch file as well (Ad.bat)

```
ubuntu@ip-172-31-32-237:~/ultimate-devops-project-demo/src/ad$ ls -ltr ./build/install/opentelemetry-demo-ad/bin/
total 28
-rwxr-xr-x 1 ubuntu ubuntu  5776 Feb 23 12:02 Ad.bat
-rwxr-xr-x 1 ubuntu ubuntu 11498 Feb 23 12:02 Ad
drwxrwxr-x 2 ubuntu ubuntu  4096 Feb 23 12:02 jar
drwxrwxr-x 2 ubuntu ubuntu  4096 Feb 23 12:02 compileJava

```

6. Next we will run these commands

```
export AD_PORT=8080
export FEATURE_FLAG_GRPC_SERVICE_ADDR=featureflagservice:50053
./build/install/opentelemetry-demo-ad/bin/Ad
```

So our ms will be running