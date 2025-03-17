
In this we will try to access the project using LB

Last time we saw this issue -

```
kubectl get svc | grep frontendproxy
opentelemetry-demo-frontendproxy           ClusterIP   172.20.169.185   <none>        8080/TCP            9m25s
```

We will edit our service and change the service to LoadBalancer - type: LoadBalancer

```
kubectl edit svc opentelemetry-demo-frontendproxy
service/opentelemetry-demo-frontendproxy edited
```
After this, apiServer will send instruction to CCM, CCM generated a FQDN, as we can see below, for this FQDN to be available, it will take around 5 min, as CCM has provisioned a load balancer for us.


```
kubectl get svc | grep frontendproxy
opentelemetry-demo-frontendproxy           LoadBalancer   172.20.169.185   a4c65f077b27b489e9945b73952a8603-2079382912.us-east-1.elb.amazonaws.com   8080:30259/TCP      102m

```

Now if i run `http://a4c65f077b27b489e9945b73952a8603-2079382912.us-east-1.elb.amazonaws.com:8080`, i can access my webpage