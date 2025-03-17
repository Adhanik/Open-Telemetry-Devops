
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
