output "web_url" {
  description = "URL to access the web server"
  value = module.ec2.web_url
}

output "ec2_instance_id" {
  description = "EC2 instance id"
  value = module.ec2.instance_id
}

output "db_endpoint" {
  description = "RDS database endpoint"
  value = module.rds.db_endpoint
}

output "db_port" {
  description = "RDS database port"
  value = module.rds.db_port
}