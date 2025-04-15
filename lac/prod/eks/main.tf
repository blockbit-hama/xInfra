resource "aws_eks_cluster" "eks_cluster" {
  name                      = var.cluster_name
  role_arn                  = aws_iam_role.eks_cluster_role.arn
#   enabled_cluster_log_types = ["api", "audit"]
  version                   = var.cluster_version

  vpc_config {
    security_group_ids      = [aws_security_group.eks_cluster_sg.id]
    subnet_ids              = var.cluster_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = var.enable_public_access
    public_access_cidrs     = var.public_access_cidrs
  }

  access_config {
    authentication_mode = "API"
    bootstrap_cluster_creator_admin_permissions = false
  }

  kubernetes_network_config {
    service_ipv4_cidr = "172.30.0.0/16"
    ip_family = "ipv4"
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSVPCResourceController,
#     aws_cloudwatch_log_group.eks_cluster_log
  ]

  tags = merge(var.tags, tomap({
    "Name" = var.cluster_name,
  }))
}