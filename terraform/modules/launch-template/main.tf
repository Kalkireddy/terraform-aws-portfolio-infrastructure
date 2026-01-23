resource "aws_security_group" "lt_sg" {
    name   = "${var.name}-lt-sg"
    description = "Security group for Launch Template instances"
    vpc_id = var.vpc_id

    ingress {
        from_port = 80
        to_port = 80
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

resource "aws_launch_template" "this" {
    name_prefix = "${var.name}-lt-"
    image_id  = var.ami
    instance_type = var.instance_type

    vpc_security_group_ids = [aws_security_group.lt_sg.id]

    user_data = base64encode(var.user_data)

    tag_specifications {
    resource_type = "instance"
    tags          = var.tags
    }


}