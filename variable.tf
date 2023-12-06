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
