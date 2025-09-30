variable "vpc_cidr" {
type        = string
description = "CIDR block for the VPC"
default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
type        = string
description = "CIDR block for the first public subnet"
default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
type        = string
description = "CIDR block for the second public subnet"
default     = "10.0.2.0/24"
}

variable "availability_zone_1" {
type        = string
description = "Availability zone for the first public subnet"
default     = "us-east-1a"
}

variable "availability_zone_2" {
type        = string
description = "Availability zone for the second public subnet"
default     = "us-east-1b"
}