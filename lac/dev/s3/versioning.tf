# S3 bucket versioning
resource "aws_s3_bucket_versioning" "local_auth_versioning" {
  bucket = aws_s3_bucket.local_auth.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "bank_code_versioning" {
  bucket = aws_s3_bucket.public_bank_code.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "loki_storage_versioning" {
  bucket = aws_s3_bucket.loki_storage.id
  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket_versioning" "mimir_storage_versioning" {
  bucket = aws_s3_bucket.mimir_storage.id
  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket_versioning" "tempo_storage_versioning" {
  bucket = aws_s3_bucket.tempo_storage.id
  versioning_configuration {
    status = "Suspended"
  }
}