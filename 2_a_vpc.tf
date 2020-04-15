resource "aws_vpc" "avi_vpc" {
  cidr_block           = var.vpc_cidr
  enable_classiclink   = true
  enable_dns_support   = true
  enable_dns_hostnames = true
  
  tags = {
    Name = var.vpc_name
  }
}