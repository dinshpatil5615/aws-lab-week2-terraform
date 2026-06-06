variable "project_name" {
  description = "Name prefix for all resources"
  type = string
}

variable "vpc_id" {
  description = "vpc id from vpc module"
  type = string
}

variable "private_subnet_1_id" {
  description = "first private subnet id"
  type = string
}

variable "private_subnet_2_id" {
  description = "second private subnet id"
  type = string
}

variable "db_username" {
  description = "Database master username"
  type = string
  default = "admin"
}

variable "db_password" {
  description = "initial database name"
  type = string
  default = "appdb"
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "appdb"
}