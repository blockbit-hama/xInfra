resource "aws_s3_bucket_ownership_controls" "bank_code_ownership" {
  bucket = aws_s3_bucket.public_bank_code.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}