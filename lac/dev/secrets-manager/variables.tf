variable "infra_secret_name" {
  description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component, e.g., 'dev/infra'"
  type        = string
}

variable "xauth_secret_name" {
  description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component"
  type        = string
}

variable "xfds_secret_name" {
  description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component"
  type        = string
}

variable "xboa_secret_name" {
  description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component"
  type        = string
}

variable "xbank_secret_name" {
  description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component"
  type        = string
}

variable "xbo_front_secret_name" {
  description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component"
  type        = string
}

variable "alt_shift_front_secret_name" {
  description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component"
  type        = string
}

variable "xprobe_secret_name" {
  description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component"
  type        = string
}

variable "secret_access_arns" {
  description = "The ARNs of the IAM entities (user and role) that can access the infra secret"
  type        = list(string)
}