

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a S3 Bucket

resource "aws_s3_bucket" "example" {
  bucket = "amit-eks-state-bucket-tf"
  lifecycle {
    prevent_destroy = false
  }


}


resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "amit-terraform-state-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"      #(Required) Attribute type. Valid values are S (string), N (number), B (binary).
  }

}