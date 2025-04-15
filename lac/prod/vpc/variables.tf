variable "region" {
  description = "The AWS region"
  type = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type = string
}

variable "cluster_name" {
  description = "name of eks cluster"
  type        = string
}

variable "cidr_numeral" {
  description = "The VPC CIDR numeral (10.x.0.0/16)"
  type = string
}

variable "cidr_numeral_public_a" {
  description = "The Public Subnets CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_public_lb_a" {
  description = "The Public LB Subnets CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_public_c" {
  description = "The Public Subnets CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_public_lb_c" {
  description = "The Public LB Subnets CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_private_a" {
  description = "The Private Subnet CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_private_a2" {
  description = "The Private Subnet CIDR numeral (10.x.x.0/24)"
  type        = string
}

variable "cidr_numeral_private_b" {
  description = "The Private Subnet CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_private_c" {
  description = "The Private Subnet CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_private_d" {
  description = "The Private Subnet CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_db_private_a" {
  description = "The DB Private Subnet CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_db_private_b" {
  description = "The DB Private Subnet CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_db_private_c" {
  description = "The DB Private Subnet CIDR numeral (10.x.x.0/24)"
  type = string
}

variable "cidr_numeral_db_private_d" {
  description = "The DB Private Subnet CIDR numeral (10.x.x.0/24)"
  type = string
}
