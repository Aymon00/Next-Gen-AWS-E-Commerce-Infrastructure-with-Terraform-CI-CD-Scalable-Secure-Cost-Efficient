# 1- Define the VPC 
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = var.vpc_name
    Environment = "project_environment"
    Terraform   = "true"
  }
}
