# 2- Deploy the public subnets
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

# 3- Deploy the private subnets
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

# Security Group to allow traffic on port 8080 (Jenkins)
resource "aws_security_group" "jenkins_sg" {
  name   = "jenkins_sg"
  vpc_id = aws_vpc.vpc.id
  
  ingress {
    description = "Allow all traffic through port 8080"
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins_sg"
  }
}
