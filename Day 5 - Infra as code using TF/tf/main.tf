terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "amit-eks-state-bucket-tf"
    key    = "terrafrom.tfstate"
    region = "us-east-1"
    dynamodb_table = "amit-terraform-state-locks"
    encrypt = true
  }
}


provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/VPC"
  vpc_cidr = var.vpc_cidr
  availability_zones = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs = var.public_subnet_cidrs
  cluster_name        = var.cluster_name
}


module "eks" {
    source = "./modules/EKS"
    cluster_name = var.cluster_name
    cluster_version = var.cluster_version
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnet_id
    node_groups = var.node_groups
  
}