
## i want to understand one thing. i have written modules for EKS and VPC, and then i am invoking these modules from a main.tf, which also has a output.tf

The output.tf here is defined like this 

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value = module.eks.cluster_endpoint
}

while for module EKS, inside it, we have main.tf, and output.tf

resource "aws_eks_cluster" "main" {
  name = var.cluster_name
  version = var.cluster_version
   .......
}
output "cluster_endpoint" {
    description = "EKS cluster endpoint"
    value = aws_eks_cluster.main.endpoint
 
}

now when we want the cluster endpoint, i think the correct way to do this is  aws_eks_cluster.main.endpoint, then why in the dir from where this module is invoked, the output.tf references it as - module.eks.cluster_endpoint?

i think i get it, this module will pick the value generated from output "cluster_endpoint"  and then use it here module.eks.cluster_endpoint . is my understanding correct? what if eks is named as EKS, in caps, do i then need to write code as module.EKS.cluster_endpoint?

## Sol



Yes, your understanding is **correct**! Let's break it down clearly:

---

## **1. How Outputs Work in Terraform Modules**
- Each module has its **own `outputs.tf` file** that defines what values it exposes.
- When you call a module in `main.tf`, you can reference these outputs using `module.<module_name>.<output_name>`.

### **How the flow works in your setup:**
1. **Inside the EKS module:**
   - You create the `aws_eks_cluster` resource.
   - You define an **output** (`cluster_endpoint`) to expose the cluster’s endpoint.
   
   ```hcl
   output "cluster_endpoint" {
     description = "EKS cluster endpoint"
     value = aws_eks_cluster.main.endpoint
   }
   ```
   
   - This means that when you use this module, it will return `aws_eks_cluster.main.endpoint`.

2. **In the parent directory (where the module is invoked):**
   - You call the module like this:
     ```hcl
     module "eks" {
       source = "./modules/eks"
       cluster_name = "my-cluster"
       ...
     }
     ```
   - Since the EKS module exposes `cluster_endpoint`, you can access it as:
     ```hcl
     output "cluster_endpoint" {
       description = "EKS cluster endpoint"
       value = module.eks.cluster_endpoint
     }
     ```
   - This is because **`module.eks.cluster_endpoint`** is picking up the value from the `output` inside the module.

---

## **2. What if the Module Name is Different?**
Terraform is **case-sensitive**, so if you name your module **"EKS"** (in uppercase), you must reference it as `module.EKS.cluster_endpoint`.

For example:
```hcl
module "EKS" {
  source = "./modules/eks"
}
```
Then, you must access the output like this:
```hcl
output "cluster_endpoint" {
  value = module.EKS.cluster_endpoint
}
```
**Conclusion:**  
Module names in Terraform must match exactly when referenced, including uppercase and lowercase differences.

Would you like any clarifications? 🚀