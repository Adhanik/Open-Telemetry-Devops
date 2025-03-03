

variable "vpc_cidr" {
    type = string
    description = "CIDR block for VPC"
  
}

variable "availability_zones" {
    description = "Availability zones"
    type = list(string)
  
}

variable "private_subnet_cidrs" {
    description = "CIDR Blocks for private subents"
    type = list(string)
  
}

variable "public_subnet_cidrs" {
    description = "CIDR blocks for public subnet"
    type = list(string)
  
}

variable "cluster_name" {
    type = string
    description = "Name of EKS Cluster"
  
}