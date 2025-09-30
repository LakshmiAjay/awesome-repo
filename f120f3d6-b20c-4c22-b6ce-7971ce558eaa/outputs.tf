output "vpc_id" {
description = "ID of the created VPC"
value       = aws_vpc.main.id
}

output "public_subnet_1_id" {
description = "ID of the first public subnet"
value       = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
description = "ID of the second public subnet"
value       = aws_subnet.public_2.id
}

output "load_balancer_dns_name" {
description = "DNS name of the created load balancer"
value       = aws_lb.ajays_house_lb.dns_name
}
providers.tf
terraform {
required_version = ">= 1.0"
required_providers {
aws = {
source  = "hashicorp/aws"
version = "~> 5.0"
}
}
}

provider "aws" {
region = "us-east-1"
}
terraform.tfvars
vpc_cidr              = "10.0.0.0/16"
public_subnet_1_cidr  = "10.0.1.0/24"
public_subnet_2_cidr  = "10.0.2.0/24"
availability_zone_1   = "us-east-1a"
availability_zone_2   = "us-east-1b"