variable "project_name" {
  description = "Name prefix for all resources"
  type = string
}

variable "vpc_id" {
  description = "vpc id from vpc module"
  type = string
}

variable "public_subnet_id" {
  description = "public subnet id for ec2"
  type = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}