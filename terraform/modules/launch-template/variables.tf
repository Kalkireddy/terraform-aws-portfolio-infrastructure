variable "name" {
  description = "Name for launch template"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "user_data" {
  description = "User data script"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
