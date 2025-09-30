resource "aws_ecs_cluster" "ajays_house_cluster" {
name = "ajays-house-cluster"
}

resource "aws_lb" "ajays_house_lb" {
name               = "ajays-house-lb"
internal           = false
load_balancer_type = "application"
security_groups    = [aws_security_group.ajays_house_lb_sg.id]
subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

resource "aws_lb_listener" "ajays_house_lb_listener" {
load_balancer_arn = aws_lb.ajays_house_lb.arn
port              = 80
protocol          = "HTTP"

default_action {
type             = "forward"
target_group_arn = aws_lb_target_group.ajays_house_tg.arn
}
}

resource "aws_lb_target_group" "ajays_house_tg" {
name        = "ajays-house-tg"
port        = 80
protocol    = "HTTP"
vpc_id      = aws_vpc.main.id
target_type = "ip"
}

resource "aws_security_group" "ajays_house_lb_sg" {
name   = "ajays-house-lb-sg"
vpc_id = aws_vpc.main.id

ingress {
from_port   = 80
to_port     = 80
protocol    = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}

egress {
from_port   = 0
to_port     = 0
protocol    = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_vpc" "main" {
cidr_block           = var.vpc_cidr
enable_dns_support   = true
enable_dns_hostnames = true

tags = {
Name = "ajays-house-vpc"
}
}

resource "aws_subnet" "public_1" {
vpc_id                  = aws_vpc.main.id
cidr_block              = var.public_subnet_1_cidr
availability_zone       = var.availability_zone_1
map_public_ip_on_launch = true

tags = {
Name = "ajays-house-public-subnet-1"
}
}

resource "aws_subnet" "public_2" {
vpc_id                  = aws_vpc.main.id
cidr_block              = var.public_subnet_2_cidr
availability_zone       = var.availability_zone_2
map_public_ip_on_launch = true

tags = {
Name = "ajays-house-public-subnet-2"
}
}

resource "aws_internet_gateway" "main" {
vpc_id = aws_vpc.main.id

tags = {
Name = "ajays-house-igw"
}
}

resource "aws_route_table" "public" {
vpc_id = aws_vpc.main.id

route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.main.id
}

tags = {
Name = "ajays-house-public-route-table"
}
}

resource "aws_route_table_association" "public_1" {
subnet_id      = aws_subnet.public_1.id
route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
subnet_id      = aws_subnet.public_2.id
route_table_id = aws_route_table.public.id
}