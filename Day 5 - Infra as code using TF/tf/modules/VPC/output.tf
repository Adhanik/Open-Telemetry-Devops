output "vpc_id" {
  description = "VPC ID"
  value = aws_vpc.main.id 
}

output "private_subnet_id" {
  description = "private subnet IDs"
  value = aws_subnet.private[*].id
}

output "public_subnet_ip" {
    description = "public subnet IDs"
    value = aws_subnet.public[*].id
  
}