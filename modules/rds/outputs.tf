output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.default.endpoint
}

output "db_instance_port" {
  description = "The database port for the RDS instance"
  value       = aws_db_instance.default.port
}
