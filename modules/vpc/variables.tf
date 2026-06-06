variable "vpc_cidr" {
  description = "CIDR block for vpc"
  type = string
  default = "10.0.0.0/16"
}

variable "project_name" {
  description = "Name prefix for all resources"
  type = string
}