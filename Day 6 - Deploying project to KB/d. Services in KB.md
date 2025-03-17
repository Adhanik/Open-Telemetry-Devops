


## Why services are required

- Helps with Service Discovery

##### What is service Discovery problem?

Suppose u have a Frontend container and a Backend container, deployed in your staging env, using Docker, and both get IP address as 10.10.2.3, 10.10.4.6

We mentioned iP of backend in our frontend config, using env variables, and it was able to connect to backend. Now for some reason backend went down, and restart policy was set to `on failure`, and it gets restarted. Now the IP address of Backend has changed, and now frontend will not be able to connect, unless we update the env variable and restart our frontend container

Hence Discovery of ms will fail only if we are using containers.

#### HoW KB services helped?

Suppose we created our frontend and backedn now using Deployments. The replica set controller creates 1 copy of each ms. But now frontend will not directly communicate with Backend, instead it will talk to a proxy, which is `service`, and this service will talk to the backend 

Now suppose when backend goes down, how will service know the new ip of backend pod? Services do not operate with ms at all, services operate with concept of `labels and selectors`. Service looks at a particular label on the backend, so now it doesnt matter if the IP address chagnes, only the label has to be unique across all your cluster, then service is able to recognise you with your unique label (for eg a tatoo).

So now when frontend has to talk to backend pod in KB, the frontend developr will have an env variable, but this env variable will be `name of Service`.

This way services resolve the problem of service discovery in KB

Service is not only for internal communication, using services, u can also allow your external users to communicate with frontend pod. For this we have multiple type of services in KB


## Service yaml

```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: NodePort
  selector:
    app.kubernetes.io/name: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
```

- port is imp bcuz whenever we a pod wants to talk to service, it does this by <service-name>:<port of service>
- If an external user wants to talk to service, they have to talk with service <FQDN:port>
- Whever you create a service, you get a FQDN
- target port is port of container. for whichever pod you are creating service, make sure u provide the correct target port.

- A service identifies pods using labels, because of the label, the service knows whats the new IP of the pod. How does service know which label it has to look at? For this, whenever we are writing the service, we will write selector definition, and within this selector, we will provide the label, which is same as our Pod specs/deployment template.



