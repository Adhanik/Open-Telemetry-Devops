
So, what is ingress controller?

Ingress controller is not available by default in KB cluster. KB does not specifiy any ingress controller, it provides you the flexibility to use any LB that u want. 

If you want to use nginx, alb, f5, u just need to deploy the ingress controller for that LB. If you want to deploy nginx LB, you need to deploy nginx ingress controller

If you want to use ALB, then u need to use ALB ingress controller. All LB companies write the go code for their ingress controller, without a ingress controller, ingress resource will not work.

Ingress controller reads all the rules from ingress resource yaml file, and creates the LB for you based on those rules.

We will create a ALB. Once the ALB reads the ingress resource, ALB will create the LB for us. Then if we try to access it using LB DNS name, or on IP address, then it will not work, because, whatver resource we have provided in our ingres resource file, only that domain name will be allowed.

