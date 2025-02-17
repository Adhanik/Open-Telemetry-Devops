

NACL by default, allows all traffic, while SG, by default, blocks all traffic. We have allowed port 22 on our Ec2 via S.G, so we will add custom TCP rule and allow all traffic/or from your laptop ip on port 8080


We can see that the app is now accessible on 65.2.188.33:8080, where 65.2.188.33 is public ip of EC2.