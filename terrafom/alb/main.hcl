provider "aws" {
  region = "us-west-2"  # Reemplaza con tu región deseada
}

resource "aws_lb" "example_alb" {
  name               = "example-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-12345678", "subnet-87654321"]  # Reemplaza con tus subnets
  security_groups    = ["sg-12345678"]  # Reemplaza con tus security groups
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.example_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_target_group.arn
  }
}

resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.example_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https_target_group.arn
  }
}

resource "aws_lb_target_group" "http_target_group" {
  name     = "http-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-12345678"  # Reemplaza con el ID de tu VPC
}

resource "aws_lb_target_group" "https_target_group" {
  name     = "https-target-group"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = "vpc-12345678"  # Reemplaza con el ID de tu VPC
}

resource "aws_lb_listener_rule" "ip_rule" {
  listener_arn = aws_lb_listener.https_listener.arn
  priority     = 100

  condition {
    field  = "source_ip"
    values = ["192.0.2.0/24"]  # Reemplaza con tus direcciones IP permitidas
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https_target_group.arn
  }
}

resource "aws_lb_listener_rule" "method_rule" {
  listener_arn = aws_lb_listener.https_listener.arn
  priority     = 200

  condition {
    field  = "http_request_method"
    values = ["POST"]
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https_target_group.arn
  }
}

resource "aws_lb_listener_certificate" "https_certificate" {
  listener_arn    = aws_lb_listener.https_listener.arn
  certificate_arn = "arn:aws:acm:us-west-2:123456789012:certificate/abc123def456"  # Reemplaza con el ARN de tu certificado ACM
}

