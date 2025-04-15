variable "account_number" {
  description = "The AWS account ID"
  type = string
}

variable "s3_local_auth_access_arns" {
  description = "access_arn of s3 local-auth"
  type = list(string)
}

variable "s3_loki_storage_access_arns" {
  description = "access_arn of s3 loki-storage"
  type        = list(string)
}

variable "s3_mimir_storage_access_arns" {
  description = "access_arn of s3 mimir-storage"
  type        = list(string)
}

variable "s3_tempo_storage_access_arns" {
  description = "access_arn of s3 tempo-storage"
  type        = list(string)
}