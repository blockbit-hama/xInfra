variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_id" {
  description = "The AWS ID of the VPC this shard is being deployed into"
  type        = string
}

variable "db_private_subnet_ids" {
  description = "IDs of db private subnet"
  type        = list(string)
}

variable "db_storage_size" {
  description = "DB storage capacity"
  type        = number
}

variable "db_max_allocated_storage" {
  description = "DB Max storage capacity"
  type        = number
}

variable "manage_master_user_password" {
  description = "Set to true to allow RDS to manage the master user password in Secrets Manager"
  type = bool
}

variable "route53_internal_zone_id" {
  description = "ID of the internal Route 53 hosted zone."
  type = string
}

variable "route53_internal_domain" {
  description = "regional internal domain name"
  type = string
}