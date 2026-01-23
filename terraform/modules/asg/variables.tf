variable "name" {
    type = string
}

variable "launch_template_id" {
    type = string
}


variable "target_group_arn" {
    type = string
}

variable "private_subnets" {
    type = list(string)
}

variable "desired_capacity" {
    type    = number
}

variable "max_size" {
    type    = number
}

variable "min_size" {
    type    = number
}

