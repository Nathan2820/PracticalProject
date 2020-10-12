output "ec2_id" {
  value = aws_instance.EC2.id
}

output "test_rds_endpoint" {
  value = aws_db_instance.testing-database.endpoint
}

output "prod_rds_endpoint" {
  value = aws_db_instance.production-database.endpoint
}