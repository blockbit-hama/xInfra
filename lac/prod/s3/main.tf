# S3 Private bucket for local auth project
resource "aws_s3_bucket" "local_auth" {
  bucket = "${var.account_number}-apnortheast2-local-auth"
}

# S3 Public bucket for bank code
resource "aws_s3_bucket" "public_bank_code" {
  bucket = "${var.account_number}-apnortheast2-public-bank-code"
}

# S3 Private bucket for loki storage
resource "aws_s3_bucket" "loki_storage" {
  bucket = "${var.account_number}-apnortheast2-loki-storage"
}

# S3 Private bucket for mimir storage
resource "aws_s3_bucket" "mimir_storage" {
  bucket = "${var.account_number}-apnortheast2-mimir-storage"
}

# S3 Private bucket for tempo storage
resource "aws_s3_bucket" "tempo_storage" {
  bucket = "${var.account_number}-apnortheast2-tempo-storage"
}