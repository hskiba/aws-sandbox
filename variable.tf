variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-2"
  type        = string
}

variable "vpc_name" {
  description = "VPC Name"
  default     = "sandbox-vpc"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

output "public_subnets" {
  description = "Public Subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private Subnets"
  value       = module.vpc.private_subnets
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "sg_all_all" {
  description = "Security Group all-all ID"
  value       = module.security_group_all_all.security_group_id
}
