output "rds_endpoint" {
  description = "Endpoint do banco de dados RDS PostgreSQL"
  value       = aws_db_instance.bd.endpoint
}

output "rds_port" {
  description = "Porta do banco de dados RDS PostgreSQL"
  value       = aws_db_instance.bd.port
}
