########################## INIT ################################
# The unique identifier for the AWS account
account_id = "terraform-prod-manager"

# The environment where resources will be deployed (e.g., prod, staging, prod)
env = "prod"

# The AWS region where resources will be deployed
region = "ap-northeast-2"

########################## IAM ################################
# The Amazon Resource Name (ARN) for the IAM user 'manager' in the AWS account
eks_manager_arn = "arn:aws:iam::209479278227:user/manager"

# The Amazon Resource Name (ARN) for the IAM policy 'IP_Blocking' in the AWS account
ip_blocking_policy_arn = "arn:aws:iam::209479278227:policy/IP_Blocking"

# The name of the organization
organization = "devblockbit"

########################## S3 ################################
# access_arn of s3 local-auth
s3_local_auth_access_arns = [
  "arn:aws:iam::209479278227:user/brad",
  "arn:aws:iam::209479278227:role/MFARequiredAdminStratorRole",
]

# access_arn of s3 loki-storage
s3_loki_storage_access_arns = [
  "arn:aws:iam::209479278227:user/brad",
#   "arn:aws:iam::209479278227:role/eks-prod-custella-monitoring-storage",
  "arn:aws:iam::209479278227:role/MFARequiredAdminStratorRole"
]

# access_arn of s3 mimir-storage
s3_mimir_storage_access_arns = [
  "arn:aws:iam::209479278227:user/brad",
#   "arn:aws:iam::209479278227:role/eks-prod-custella-monitoring-storage",
  "arn:aws:iam::209479278227:role/MFARequiredAdminStratorRole"
]

# access_arn of s3 tempo-storage
s3_tempo_storage_access_arns = [
  "arn:aws:iam::209479278227:user/brad",
#   "arn:aws:iam::209479278227:role/eks-prod-custella-monitoring-storage",
  "arn:aws:iam::209479278227:role/MFARequiredAdminStratorRole"
]

# The AWS account number for the account ID
account_number = "209479278227"

########################## VPC ################################
# The name of the VPC
vpc_name = "custella-prod"

# The VPC CIDR numeral (10.x.0.0/16)
cidr_numeral = "20"

# The Public Subnets CIDR numeral (10.x.x.0/24)
cidr_numeral_public_a    = "0"
cidr_numeral_public_c    = "2"
cidr_numeral_public_lb_a = "10"
cidr_numeral_public_lb_c = "12"

# The Private Subnets CIDR numeral (10.x.x.0/24)
cidr_numeral_private_a = "100"
cidr_numeral_private_b = "101"
cidr_numeral_private_c = "102"
cidr_numeral_private_d = "103"
cidr_numeral_private_a2 = "110"

# The DB Private Subnets CIDR numeral (10.x.x.0/24)
cidr_numeral_db_private_a = "200"
cidr_numeral_db_private_b = "201"
cidr_numeral_db_private_c = "202"
cidr_numeral_db_private_d = "203"

########################## Route53 ################################
# regional internal domain name
internal_domain = "custella.com"

########################## ACM ################################
fully_qualified_domain_name = "*.custellax.com"

########################## Secrets Manager ################################
# The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component, e.g., 'prod/infra'
infra_secret_name = "prod/infra"
xauth_secret_name = "prod/xauth"
xfds_secret_name = "prod/xfds"
xboa_secret_name = "prod/xboa"
xbank_secret_name = "prod/xbank"
xprobe_secret_name = "prod/xprobe"

# The ARNs of the IAM entities (user and role) that can access the infra secret
secret_access_arns = [
  "arn:aws:iam::209479278227:user/brad",
  "arn:aws:iam::209479278227:role/MFARequiredAdminStratorRole"
#   "arn:aws:iam::209479278227:role/eks-prod-custella-external-secrets"
]

########################## RDS ################################
# DB storage capacity
db_storage_size = 50

# DB Max storage capacity
db_max_allocated_storage = 100

# Set to true to allow RDS to manage the master user password in Secrets Manager
manage_master_user_password = true

########################## EKS ################################
# name of cluster
cluster_name = "prod-custella"

# Cluster information
cluster_version = "1.31"

# whether or not public access to eks cluster
enable_public_access = true

# cidr list from public access
public_access_cidrs = ["121.135.190.142/32", "221.149.139.53/32", "61.82.119.75/32"]

# version of coredns
# https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/managing-coredns.html
coredns_version = "v1.11.3-eksbuild.1"

# version of kube_proxy
# https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/managing-kube-proxy.html
kube_proxy_version = "v1.30.3-eksbuild.5"

# version of vpc_cni
# https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/managing-vpc-cni.html
vpc_cni_version = "v1.18.5-eksbuild.1"

# version of aws_ebs_csi_driver
# https://github.com/kubernetes-sigs/aws-ebs-csi-driver
aws_ebs_csi_driver_version = "v1.36.0-eksbuild.1"

# version of eks_pod_identity
# https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/pod-identities.html
eks_pod_identity_version = "v1.3.0-eksbuild.1"

# Managed Node Group inforation
# https://github.com/awslabs/amazon-eks-ami/releases
node_group_release_version = "1.30.0-20240625"

# Node Group AMI type
# https://docs.aws.amazon.com/eks/latest/APIReference/API_Nodegroup.html#AmazonEKS-Type-Nodegroup-amiType
node_group_ami_type = "AL2023_x86_64_STANDARD"

keycloak_lb_dns = "prod-custella-1612895270.ap-northeast-2.elb.amazonaws.com"