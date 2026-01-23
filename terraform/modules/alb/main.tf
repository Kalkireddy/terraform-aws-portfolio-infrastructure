resource "aws_security_group" "alb_sg" {
    name    = "${var.name}-alb-sg"
    description = "Security group for ALB"
    vpc_id = var.vpc_id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = var.tags
}

resource "aws_lb" "this" {
    name               = "${var.name}-alb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.alb_sg.id]
    subnets            = var.public_subnets

    tags = var.tags
}

resource "aws_lb_target_group" "this" {
    name        = "${var.name}-tg"
    port        = 80
    protocol    = "HTTP"
    vpc_id      = var.vpc_id
    target_type = "instance"

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 3
        interval            = 30
        path                = "/"
        matcher             = "200"
    }

    tags = var.tags
}


resource "aws_lb_listener" "https" {
    load_balancer_arn = aws_lb.this.arn
    port              = "443"
    protocol          = "HTTPS"
    ssl_policy        = "ELBSecurityPolicy-2016-08"
    certificate_arn   = var.acm_certificate_arn

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.this.arn
    }
}

resource "aws_lb_listener" "http_redirect" {
    load_balancer_arn = aws_lb.this.arn
    port              = "80"
    protocol          = "HTTP"

    default_action {
        type = "redirect"

        redirect {
            port        = "443"
            protocol    = "HTTPS"
            status_code = "HTTP_301"
        }
    }
}


#This creates:
#ALB security group
#ALB
#Target group
#Listener
#Everything needed for traffic routing