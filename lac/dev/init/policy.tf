# Setting backend s3 bucket policy to control access to tfstate files
resource "aws_s3_bucket_policy" "tfstate_bucket_policy" {
  bucket = aws_s3_bucket.tfstate.id
  policy = data.aws_iam_policy_document.tfstate_policy_document.json
}