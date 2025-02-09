/* Create the Load balancer including SG , Target Group , Listeners */
# 13 Security group for ALB
resource "aws_security_group" "ALBSG" {
  name        = "ALBSG"
  description = "security group for alb"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.WebSG.id]
  }
}

# 14- Create ALB
resource "aws_lb" "project_alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ALBSG.id]
  subnets            = [aws_subnet.public_subnets["us-east-1a"].id, aws_subnet.public_subnets["us-east-1b"].id]
}

# 15- Create ALB target group
resource "aws_lb_target_group" "project_tg" {
  name     = "project-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  depends_on = [aws_vpc.vpc]
}

# 16- Create target attachments
resource "aws_lb_target_group_attachment" "tg_attach1" {
  target_group_arn = aws_lb_target_group.project_tg.arn
  target_id        = aws_instance.web.id
  port             = 80

  depends_on = [aws_instance.web]
}

resource "aws_lb_target_group_attachment" "tg_attach2" {
  target_group_arn = aws_lb_target_group.project_tg.arn
  target_id        = aws_instance.app.id
  port             = 80

  depends_on = [aws_instance.app]
}

# 17- Create listener
resource "aws_lb_listener" "listener_lb" {
  load_balancer_arn = aws_lb.project_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.project_tg.arn
  }
}

# 18- install EC2 Launch Configuration
resource "aws_launch_configuration" "Scaled_instance" {
  name_prefix     = "Scaled_launch_instance"
  image_id        = "ami-0dfcb1ef8550277af"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.WebSG.id]

  lifecycle {
    create_before_destroy = true
  }
}
