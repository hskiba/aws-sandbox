module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name

  cidr = var.vpc_cidr

  # Use all availability zones
  azs = data.aws_availability_zones.region.names
  private_subnets = [
    for num in range(0, 2 * length(data.aws_availability_zones.region.names), 2) :
    cidrsubnet(var.vpc_cidr, 8, num)
  ]
  public_subnets = [
    for num in range(1, 2 * length(data.aws_availability_zones.region.names), 2) :
    cidrsubnet(var.vpc_cidr, 8, num)
  ]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_dns_hostnames   = true
  enable_dns_support     = true

  tags = {
    Name = var.vpc_name
  }
}

data "aws_availability_zones" "region" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }

  filter {
    name   = "region-name"
    values = [data.aws_region.current.name]
  }
}
