

We write code in modules, modules are basically reusable code. We write code once to create aws service, and then invoke the same module to build that resource. We will have module code for VPC, EKS etc


We will be invoking module code from main.tf

backend
module
  - eks
  - vpc

main.tf