locals {
  engine         = "postgres"
  engine_version = "16.3"

  is_multi_az = false

  identifier = "prod-postgres"
  username   = "dba"

  storage_type   = "gp3"
  instance_class = "db.t3.small"

  zone_a             = "ap-northeast-2a"
  ca_cert_identifier = "rds-ca-rsa2048-g1"
  port               = "5432"

  performance_insights_retention_period = 7
  backup_retention_period               = 7
  backup_window                         = "17:00-18:00"
  backup_target                         = "region"
  maintenance_window                    = "Sun:18:30-Sun:19:30"
}