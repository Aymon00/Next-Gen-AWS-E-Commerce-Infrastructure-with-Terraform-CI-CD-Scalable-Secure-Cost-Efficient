# 21- Database subnet group
resource "aws_db_subnet_group" "db_subnet" {
  name       = "rds-db-subnet"
  subnet_ids = [aws_subnet.private_subnets["us-east-1a"].id, aws_subnet.private_subnets["us-east-1b"].id]
}


# 22- Create the database Security Group
resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "security group for RDS database"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port       = "0"
    to_port         = "0"
    protocol        = "-1"
    security_groups = [aws_security_group.WebSG.id]
  }
}

# 23-  Create database instance
resource "aws_db_instance" "rds_instance" {
  allocated_storage      = 20
  identifier             = "rds-terraform"
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.small"
  db_name                = "project_rds"
  username               = "dolfined"
  password               = "dolfined"
  publicly_accessible    = false
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  tags = {
    Name = "ExampleRDSServerInstance"
  }
}

