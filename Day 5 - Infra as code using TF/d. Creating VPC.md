
https://opentelemetry.io/docs/demo/architecture/

- We will write a VPC TF resource.

- We will have a private subnet where we will be creating our KB cluster, whereas we will have a public subnet as well which will consist of the Frontend Proxy, as shown in architecture diagram.

- By default, resources in public subnet will not be accessible from internet, so we will assing IGW to this public subent. IGW cannot be directly attached to public subnet, every subnet has a route table , once route table is created, we will associate this route table with IGW, and then attach RT to subent.

- For resources in private subent to talk to Internet, we will configure NAT Gateways.

- Next we will need Route tables , to associate public subent with IGW, we need route table. Route table are associated with IGW, as well as NAT Gateways

Note - In modules, we dont have to write the provider configuration. Modules are reusable, so they will be called by somebody else, where they will provide the provider configuration. The module code is used and executed by someone else in their code, so this does not get executed directly. Infact the one invoking the module code will provide the provider information.

So modules block directly start with resource block.


- We will start with writing the VPC TF files first