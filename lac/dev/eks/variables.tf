variable "cluster_name" {
  description = "name of cluster"
  type        = string
}

variable "cluster_version" {
  description = "version of eks_cluster"
  type        = string
}

variable "target_vpc" {
  description = "The AWS ID of the VPC this shard is being deployed into"
  type        = string
}

variable "cluster_subnet_ids" {
  description = "List of private subnet ID in VPC"
  type        = list(string)
}

variable "private_subnet_zone_a_ids" {
  description = "List of private subnet ID in VPC"
  type        = list(string)
}

variable "enable_public_access" {
  description = "whether or not public access to eks cluster"
  type        = bool
}

variable "public_access_cidrs" {
  description = "cidr list from public access"
  type        = list(string)
}

variable "cluster_policy_list" {
  description = "eks cluster iam assume role policy statement list"
  type        = list(object({
    type       = string
    identifier = list(string)
  }))
  default = []
}

variable "additional_ingress" {
  description = "additional ingress rule"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {}
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

variable "region" {
  description = "The AWS region where resources will be deployed"
  type        = string
}

variable "loki_storage_arn" {
  description = "arn of s3 loki storage"
  type        = string
}

variable "mimir_storage_arn" {
  description = "arn of s3 mimir storage"
  type        = string
}

variable "tempo_storage_arn" {
  description = "arn of s3 tempo storage"
  type        = string
}

variable "route53_internal_zone_id" {
  description = "ID of the internal Route 53 hosted zone."
  type = string
}

variable "route53_internal_domain" {
  description = "keycloak internal domain name"
  type = string
}

variable "keycloak_lb_dns" {
  description = "keycloak LB DNS"
  type = string
}

