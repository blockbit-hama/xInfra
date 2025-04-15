resource "aws_db_instance" "postgres" {
  # Instance Configuration
  engine                      = local.engine
  engine_version              = local.engine_version
  multi_az                    = local.is_multi_az
  identifier                  = local.identifier
  username                    = local.username
  manage_master_user_password = var.manage_master_user_password
  instance_class = local.instance_class

  # Storage
  storage_encrypted = true
  storage_type      = local.storage_type
  allocated_storage = var.db_storage_size
  max_allocated_storage = var.db_max_allocated_storage

  # Connection
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.dev_postgres.id]
  availability_zone      = local.zone_a
  ca_cert_identifier     = local.ca_cert_identifier
  port = local.port

  # Monitoring
  performance_insights_enabled = true
  performance_insights_retention_period = local.performance_insights_retention_period

  # Additional configuration
  parameter_group_name            = aws_db_parameter_group.custella_postgres_pg.name
  backup_retention_period         = local.backup_retention_period
  backup_window                   = local.backup_window
  backup_target                   = local.backup_target
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  auto_minor_version_upgrade      = false
  maintenance_window              = local.maintenance_window

  deletion_protection = true
  skip_final_snapshot = true

  tags = {
    Name = "postgres-${var.vpc_name}"
  }
}