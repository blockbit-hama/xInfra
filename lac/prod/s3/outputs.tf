output "loki_storage_arn" {
  description = "arn of s3 loki storage"
  value       = aws_s3_bucket.loki_storage.arn
}

output "mimir_storage_arn" {
  description = "arn of s3 mimir storage"
  value       = aws_s3_bucket.mimir_storage.arn
}

output "tempo_storage_arn" {
  description = "arn of s3 tempo storage"
  value       = aws_s3_bucket.tempo_storage.arn
}