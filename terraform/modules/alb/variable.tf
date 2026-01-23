variable "name" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "public_subnets" {
    type = list(string)  
}

variable "tags" {
    type = map(string)
}

variable "acm_certificate_arn" {
    type = string
}