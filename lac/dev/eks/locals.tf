locals {
  cluster_admin_arn = "arn:aws:iam::637423218787:user/dante"
  cluster_admin_policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  cluster_manager_arn = "arn:aws:iam::637423218787:role/EKSManager"

  openid_connect_provider_id = aws_iam_openid_connect_provider.oidc_provider.arn
  openid_connect_provider_url = replace(aws_iam_openid_connect_provider.oidc_provider.url, "https://", "")
}