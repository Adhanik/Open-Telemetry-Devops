
## Cons of using LB to expose our application

Service of type LB -> apiServer -> CCM -> AWS -> Provisions a LB

In above approach, 

1. No declartive - LB is not created declaratively.
2. Manual Change - It works on http. If i need to make it secure, i need to add tls configuration to it on AWS side. So anything that load balancer needs changes have to be done from AWS UI, and we cannot keep a track of what changes have been made.

3. Not cost effective - For our project, only frontend proxy have external access. But if assume there are 10 services that need to have external access, then we need to change service type for 10 services to `load balancer`, and AWS would need to create 10 LB, which would result in substantial cost.

4. Lack of flexibitly - By default CCM can create only ALB. We cannot use nginx, f5 or other LB

5. If CCM is not there, this approach will not work

Hence one should go for ingress.

Ingress provides foll advantages -

1. Its declarative
2. Using labels and annotations, you can make use of 1000s of properties related to LB.
3. Its cost effective, even if you have 100s of ms, using path and host, we can create one LB , and 100 targets group, so LB can route request to 10 or 20 or 100 ms, which is done using host or path based routing.

4. You can create any type of Loadbalancer if you create ingress resource
5. It is not dependent on CCM. Ingress controller can still create an external ip address using  proxy or any other method.



