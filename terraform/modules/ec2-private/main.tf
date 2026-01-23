#This EC2 instance has no public IP and is only reachable from inside the VPC.

resource "aws_security_group" "private_sg" {
    name     = "private_sg"
    description = "Allow internal traffic only"
    vpc_id = var.vpc_id

    ingress {
        description = "Allow traffic from VPC"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["10.0.0.0/16"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "private_sg"
    }
}    

resource "aws_instance" "private" {
    ami    = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.private_sg.id]


    # No public IP assignment
    associate_public_ip_address = false
    
    tags = {
        Name = "private-ec2"
    }   

}