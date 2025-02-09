#2- Deploy the public subnets
resource "aws_subnet" "public_subnets" {
  for_each                = var.public_subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, each.value)
  map_public_ip_on_launch = true
  availability_zone       = each.key
  tags = {
    Name      = "${each.key}_public_subnet"
    Terraform = "true"
  }
}

#3- Deploy the private subnets
resource "aws_subnet" "private_subnets" {
  for_each          = var.private_subnets
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, each.value)
  availability_zone = each.key

  tags = {
    Name      = "${each.key}_private_subnet"
    Terraform = "true"
  }
}
