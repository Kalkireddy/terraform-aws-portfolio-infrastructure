output "alb_arn" {
    description = "ALB ARN"
    value       = aws_lb.this.arn
}

output "target_group_arn" {
    description = "Target Group ARN"
    value       = aws_lb_target_group.this.arn
}

output "alb_dns_name" {
    description = "ALB DNS Name"
    value       = aws_lb.this.dns_name
}