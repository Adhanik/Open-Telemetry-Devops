
variable "cluster_name" {
    description = "Name of the EKS cluster" 
    type = string
  
}

variable "cluster_version" {
    description = "version of EKS cluster"
    type = string   
  
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type = list(string)
  
}