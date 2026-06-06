variable "project_name" {
  description = "Name prefix for all resources"
  type = string
  default = "week2-lab"
}

variable "aws_region" {
  description = "AWS region"
  type = string
  default = "us-east-1"
}

variable "db_password" {
  description = "RDS master password"
  type = string
  sensitive = true
}