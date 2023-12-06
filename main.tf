terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
  backend "s3" {
    bucket         = "hskiba-sandbox-terraform-state"
    key            = "tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-state-lock"
  }
}

provider "aws" {
  region              = var.region
  allowed_account_ids = [var.account_id]
}

data "aws_region" "current" {}
