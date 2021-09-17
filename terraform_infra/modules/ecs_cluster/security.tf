#Security group for load balancer

resource "aws_security_group" "alb" {
  name = "${var.env}-${var.app_name}-lb_sg"

  description = "controls connection to alb"
  vpc_id      = aws_vpc.demoecs_vpc.id

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "${var.env}-${var.app_name}-lb_sg"
  }
}


#Security group ecs service
resource "aws_security_group" "app_security_group" {
  name        = "${var.env}-${var.app_name}-ecs_service_sg"
  description = "Security group for our application"
  vpc_id      = aws_vpc.demoecs_vpc.id

  ingress {
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  depends_on = [aws_security_group.alb]
}
