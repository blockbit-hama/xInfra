resource "aws_s3_bucket_policy" "local_auth_bucket_policy" {
  bucket = aws_s3_bucket.local_auth.id
  policy = data.aws_iam_policy_document.local_auth_policy_document.json
}

resource "aws_s3_bucket_policy" "public_bank_code_bucket_policy" {
  bucket = aws_s3_bucket.public_bank_code.id
  policy = data.aws_iam_policy_document.bank_code_policy_document.json
}

resource "aws_s3_bucket_policy" "private_loki_storage_policy" {
  bucket = aws_s3_bucket.loki_storage.id
  policy = data.aws_iam_policy_document.loki_storage_policy_document.json
}

resource "aws_s3_bucket_policy" "private_mimir_storage_policy" {
  bucket = aws_s3_bucket.mimir_storage.id
  policy = data.aws_iam_policy_document.mimir_storage_policy_document.json
}

resource "aws_s3_bucket_policy" "private_tempo_storage_policy" {
  bucket = aws_s3_bucket.tempo_storage.id
  policy = data.aws_iam_policy_document.tempo_storage_policy_document.json
}