################### Karpenter Node ##########################
resource "aws_eks_access_entry" "karpenter_node_access_entry" {
  cluster_name      = var.cluster_name
  principal_arn     = aws_iam_role.karpenter_node.arn
  type      = "EC2_LINUX"
}

################### EKS Manager ############################
resource "aws_eks_access_entry" "eks_manager_access_entry" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  principal_arn     = local.cluster_manager_arn
  kubernetes_groups = []
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "eks_manager_access_policy_association" {
  cluster_name  = aws_eks_cluster.eks_cluster.name
  policy_arn    = local.cluster_admin_policy_arn
  principal_arn = local.cluster_manager_arn

  access_scope {
    type       = "cluster"
    namespaces = []
  }
}

################### dante ############################
resource "aws_eks_access_entry" "eks_access_dante_entry" {
  cluster_name      = aws_eks_cluster.eks_cluster.name
  principal_arn     = local.cluster_admin_arn
  kubernetes_groups = []
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "eks_dante_access_policy_association" {
  cluster_name  = aws_eks_cluster.eks_cluster.name
  policy_arn    = local.cluster_admin_policy_arn
  principal_arn = local.cluster_admin_arn

  access_scope {
    type       = "cluster"
    namespaces = []
  }
}