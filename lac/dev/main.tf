module "init" {
  source = "./init/"

  account_id = var.account_id
}

module "iam" {
  source = "./iam/"

  eks_manager_arn        = var.eks_manager_arn
  ip_blocking_policy_arn = var.ip_blocking_policy_arn
  account_number         = var.account_number
  organization           = var.organization
}

module "s3" {
  source = "./s3/"

  account_number               = var.account_number
  s3_local_auth_access_arns    = var.s3_local_auth_access_arns
  s3_loki_storage_access_arns  = var.s3_loki_storage_access_arns
  s3_mimir_storage_access_arns = var.s3_mimir_storage_access_arns
  s3_tempo_storage_access_arns = var.s3_tempo_storage_access_arns
}

module "vpc" {
  source = "./vpc/"

  region                    = var.region
  vpc_name                  = var.vpc_name
  cluster_name              = var.cluster_name
  cidr_numeral              = var.cidr_numeral
  cidr_numeral_public_a     = var.cidr_numeral_public_a
  cidr_numeral_public_c     = var.cidr_numeral_public_c
  cidr_numeral_public_lb_a  = var.cidr_numeral_public_lb_a
  cidr_numeral_public_lb_c  = var.cidr_numeral_public_lb_c
  cidr_numeral_private_a    = var.cidr_numeral_private_a
  cidr_numeral_private_a2   = var.cidr_numeral_private_a2
  cidr_numeral_private_b    = var.cidr_numeral_private_b
  cidr_numeral_private_c    = var.cidr_numeral_private_c
  cidr_numeral_private_d    = var.cidr_numeral_private_d
  cidr_numeral_db_private_a = var.cidr_numeral_db_private_a
  cidr_numeral_db_private_b = var.cidr_numeral_db_private_b
  cidr_numeral_db_private_c = var.cidr_numeral_db_private_c
  cidr_numeral_db_private_d = var.cidr_numeral_db_private_d
}

module "route53" {
  source = "./route53/"

  internal_domain = var.internal_domain
  vpc_name        = var.vpc_name
  vpc_id          = module.vpc.vpc_id
}

module "acm" {
  source = "./acm/"

  fully_qualified_domain_name = var.fully_qualified_domain_name
}

module "secrets-manager" {
  source = "./secrets-manager/"

  infra_secret_name           = var.infra_secret_name
  xauth_secret_name           = var.xauth_secret_name
  xfds_secret_name            = var.xfds_secret_name
  xboa_secret_name            = var.xboa_secret_name
  xbank_secret_name           = var.xbank_secret_name
  xbo_front_secret_name       = var.xbo_front_secret_name
  alt_shift_front_secret_name = var.alt_shift_front_secret_name
  xprobe_secret_name          = var.xprobe_secret_name
  secret_access_arns          = var.secret_access_arns
}

module "rds" {
  source = "./rds/"

  vpc_name              = var.vpc_name
  vpc_id                = module.vpc.vpc_id
  db_private_subnet_ids = module.vpc.db_private_subnet_ids

  db_storage_size             = var.db_storage_size
  db_max_allocated_storage    = var.db_max_allocated_storage
  manage_master_user_password = var.manage_master_user_password

  route53_internal_zone_id = module.route53.route53_internal_zone_id
  route53_internal_domain  = module.route53.route53_internal_domain
}

module "eks" {
  source = "./eks/"

  region          = var.region
  cluster_name    = var.cluster_name
  target_vpc      = module.vpc.vpc_id
  cluster_version = var.cluster_version

  cluster_subnet_ids = [
    module.vpc.private_subnet_a_id,
    module.vpc.private_subnet_c_id
  ]

  private_subnet_zone_a_ids = [
    module.vpc.private_subnet_a_id,
    module.vpc.private_subnet_a2_id
  ]

  enable_public_access = var.enable_public_access
  public_access_cidrs  = var.public_access_cidrs

  node_group_release_version = var.node_group_release_version
  node_group_ami_type        = var.node_group_ami_type

  coredns_version            = var.coredns_version
  kube_proxy_version         = var.kube_proxy_version
  vpc_cni_version            = var.vpc_cni_version
  aws_ebs_csi_driver_version = var.aws_ebs_csi_driver_version
  eks_pod_identity_version   = var.eks_pod_identity_version

  loki_storage_arn  = module.s3.loki_storage_arn
  mimir_storage_arn = module.s3.mimir_storage_arn
  tempo_storage_arn = module.s3.tempo_storage_arn

  route53_internal_zone_id = module.route53.route53_internal_zone_id
  route53_internal_domain  = module.route53.route53_internal_domain
  keycloak_lb_dns          = var.keycloak_lb_dns
}

module "ecr" {
  source = "./ecr/"

}