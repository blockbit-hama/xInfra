########################## INIT ################################
variable "account_id" {
  description = "The unique identifier for the AWS account"
  type        = string
}

variable "env" {
  type        = string
  description = "The environment where resources will be deployed (e.g., dev, staging, prod)"
  default     = "dev"
}

variable "region" {
  type        = string
  description = "The AWS region where resources will be deployed"
  default     = "ap-northeast-2"
}

########################## IAM ################################
variable "eks_manager_arn" {
  description = "arn of eks cluster manager"
  type        = string
}

variable "ip_blocking_policy_arn" {
  description = "arn of ip blocking policy"
  type        = string
}

variable "organization" {
  description = "The name of the organization"
  type        = string
}

########################## S3 ################################
variable "s3_local_auth_access_arns" {
  description = "access_arn of s3 local-auth"
  type        = list(string)
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

variable "account_number" {
  description = "The AWS account ID"
  type = string
}

########################## VPC ################################
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "cidr_numeral" {
  description = "The VPC CIDR numeral (10.x.0.0/16)"
  type        = string
}

variable "cidr_numeral_public_a" {
  description = "The Public Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_public_lb_a" {
  description = "The Public LB Subnets CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_public_c" {
  description = "The Public Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_public_lb_c" {
  description = "The Public LB Subnets CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_private_a" {
  description = "The Private Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_private_a2" {
  description = "The Private Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_private_b" {
  description = "The Private Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_private_c" {
  description = "The Private Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_private_d" {
  description = "The Private Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_db_private_a" {
  description = "The DB Private Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_db_private_b" {
  description = "The DB Private Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_db_private_c" {
  description = "The DB Private Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_db_private_d" {
  description = "The DB Private Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

########################## Route53 ################################
variable "internal_domain" {
  description = "regional internal domain name"
  type = string
}

########################## ACM ################################
variable "fully_qualified_domain_name" {
  description = "The certificate domain name used by ACM"
  type = string
}

########################## Secrets Manager ################################
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

variable "xprobe_secret_name" {
  description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component"
  type        = string
}

variable "secret_access_arns" {
  description = "The ARNs of the IAM entities (user and role) that can access the infra secret"
  type        = list(string)
}

########################## EKS ################################
variable "cluster_name" {
  description = "name of cluster"
  type        = string
}

variable "cluster_version" {
  description = "version of eks_cluster"
  type        = string
}

variable "enable_public_access" {
  description = "whether or not public access to eks cluster"
  type        = bool
}

variable "public_access_cidrs" {
  description = "cidr list from public access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "node_group_release_version" {
  description = "version of Managed Node Group"
  type        = string
}

variable "node_group_ami_type" {
  description = "# Node Group AMI type"
  type        = string
}

variable "coredns_version" {
  description = "version of coredns"
  type        = string
}

variable "kube_proxy_version" {
  description = "version of kube_proxy"
  type        = string
}

variable "vpc_cni_version" {
  description = "version of vpc_cni"
  type        = string
}

variable "aws_ebs_csi_driver_version" {
  description = "version of aws_ebs_csi_driver"
  type        = string
}

variable "eks_pod_identity_version" {
  description = "version of eks_pod_identity"
  type        = string
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
  type        = bool
}

variable "keycloak_lb_dns" {
  description = "keycloak LB DNS"
  type = string
}
