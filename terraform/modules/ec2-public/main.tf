resource "aws_security_group" "public_sg" {
    name     = "public_sg"
    description = "Allow SSH and HTTTP"
    vpc_id     = var.vpc_id

    ingress {
        description = "SSH"
        from_port  = 22
        to_port    = 22
        protocol   = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port  = 0
        to_port    = 0
        protocol   = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags =  {
        Name = "public_sg"
    }
}   

resource "aws_instance" "public" {
    ami      = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.public_sg.id]
    associate_public_ip_address = true

    tags = {
        Name = "pulblic-ec2"
    }
}
