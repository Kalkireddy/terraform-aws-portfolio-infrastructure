variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "az" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    Project     = "Shiv-Terraform"
    Environment = "Dev"
  }
}


variable "acm_certificate_arn" {
  description = "ARN of the ACM cerificate to use for HTTPS"
  type        = string

}