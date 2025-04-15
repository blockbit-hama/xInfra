resource "aws_s3_bucket_public_access_block" "local_auth_access_block" {
  bucket = aws_s3_bucket.local_auth.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "public_bank_code_access_block" {
  bucket = aws_s3_bucket.public_bank_code.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_public_access_block" "loki_storage_access_block" {
  bucket = aws_s3_bucket.loki_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "mimir_storage_access_block" {
  bucket = aws_s3_bucket.mimir_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "tempo_storage_access_block" {
  bucket = aws_s3_bucket.tempo_storage.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}