output "vpc_id" {
value       = aws_vpc.main.id
description = "ID of the created VPC"
}

output "public_subnet_1_id" {
value       = aws_subnet.public_1.id
description = "ID of the first public subnet"
}

output "public_subnet_2_id" {
value       = aws_subnet.public_2.id
description = "ID of the second public subnet"
}

output "load_balancer_dns_name" {
value       = aws_lb.ajays_house_lb.dns_name
description = "DNS name of the created load balancer"
}