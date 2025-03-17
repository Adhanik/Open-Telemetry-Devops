

## Ingress 

Ingress is the incoming traffic  that is coming to your app service or cluster. KB has a resource of kind Ingress, where it can help you with defining routing rules for your incoming traffic.

Using kubernetes kind resource `ingress`, we can define rules on incoming traffic to our cluster.

When you check your LB, in target instance we ca can see the frontend service there

Generally comapies block access on ip address for many reasons. If we try to access  54.239.28.85, we see nothing on this page

```
 nslookup amazon.com
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	amazon.com
Address: 54.239.28.85
Name:	amazon.com
Address: 52.94.236.248
Name:	amazon.com
Address: 205.251.242.103

```

For our project, if we try nslookup a4c65f077b27b489e9945b73952a8603-2079382912.us-east-1.elb.amazonaws.com

```
Server:		127.0.0.53
Address:	127.0.0.53#53

Non-authoritative answer:
Name:	a4c65f077b27b489e9945b73952a8603-2079382912.us-east-1.elb.amazonaws.com
Address: 3.213.99.94
Name:	a4c65f077b27b489e9945b73952a8603-2079382912.us-east-1.elb.amazonaws.com
Address: 54.208.245.143

```
I am able to access my app on http://3.213.99.94:8080/ which is a red flag, as no company want this happen. to prevent this, routing rules are defined. In KB, `routing rules can only be defined if you are using ingress`

So we will define a ingress resource, where in ingress resource, we will create a LB, and this LB should only be accessible when someone types amazon.com

So previously CCM was reading service of type LoadBalancer, and creating the LB for us. Now we create a KB resource of type Ingress, and now this ingress needs to be read by `ingress controller` which is a kB controller, this ingress controller, acc to configuration provided in ingress resource (host based routing and other rules), it will create the load balancer for us with all those configurations.

**Note - Remeber, acc to rules defined in ingress resource file, ingress controller will create the LB**

## Sample yaml
```

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: 
  labels: 
spec:
  rules:
    - host: amazon.com
      https:
        paths:
          path:  /

```

Next we will be creating ingress resource for our frontend proxy


