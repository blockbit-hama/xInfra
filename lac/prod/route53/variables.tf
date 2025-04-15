variable "vpc_id" {
  description = "The AWS ID of the VPC this shard is being deployed into"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "internal_domain" {
  description = "regional internal domain name"
  type = string
}
