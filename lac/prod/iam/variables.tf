variable "eks_manager_arn" {
  description = "arn of eks cluster manager"
  type = string
}

variable "ip_blocking_policy_arn" {
  description = "arn of ip blocking policy"
  type = string
}

variable "account_number" {
  description = "The AWS account ID"
  type = string
}

variable "organization" {
  description = "The name of the organization"
  type        = string
}