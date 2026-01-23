output "public_instance_id" {
    value = aws_instance.public.id
}

output "public_instance_publiic_ip" {
    value = aws_instance.public.public_ip
}