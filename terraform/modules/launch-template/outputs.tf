output "launch_template_id" {
    value = aws_launch_template.this.id  
}

output "launch_template_latest_version" {
    value = aws_launch_template.this.latest_version
}

output "lt_sg_id" {
    value = aws_security_group.lt_sg.id
}