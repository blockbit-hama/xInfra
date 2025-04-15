resource "aws_db_parameter_group" "custella_postgres_pg" {
  name = "custella-postgres-pg"
  description = "Custom PostgreSQL parameter group for logging and performance settings"
  family = "postgres16"

  parameter {
    name  = "timezone"
    value = "Asia/Seoul"
  }

  parameter {
    name  = "log_temp_files"
    value = 1024
  }

  parameter {
    name  = "log_min_messages"
    value = "error"
  }

  parameter {
    name  = "log_lock_waits"
    value = "1"
  }

  parameter {
    name  = "log_statement"
    value = "ddl"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "1000"
  }

  parameter {
    name  = "log_autovacuum_min_duration"
    value = "1000"
  }

  parameter {
    name  = "rds.force_autovacuum_logging_level"
    value = "log"
  }

  parameter {
    name  = "auto_explain.log_min_duration"
    value = "1000"
  }

  parameter {
    name  = "log_error_verbosity"
    value = "verbose"
  }

  parameter {
    name  = "rds.force_admin_logging_level"
    value = "log"
  }

}