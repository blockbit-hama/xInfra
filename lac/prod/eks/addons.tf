resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.eks_cluster.name

  addon_name    = "coredns"
  addon_version = var.coredns_version

  resolve_conflicts_on_create = "OVERWRITE"
  configuration_values = jsonencode({
    computeType = "Fargate"
  })

#   depends_on = [
#     aws_eks_node_group.eks_node_group,
#   ]
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name  = aws_eks_cluster.eks_cluster.name
  addon_name    = "kube-proxy"
  addon_version = var.kube_proxy_version

  resolve_conflicts_on_create = "OVERWRITE"

#   depends_on = [
#     aws_eks_node_group.eks_node_group,
#   ]
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks_cluster.name

  addon_name    = "vpc-cni"
  addon_version = var.vpc_cni_version

  service_account_role_arn = aws_iam_role.cni_irsa_role.arn
  resolve_conflicts_on_create = "OVERWRITE"

#   depends_on = [
#     aws_eks_node_group.eks_node_group,
#   ]
}

resource "aws_eks_addon" "aws_ebs_csi_driver" {
  cluster_name = aws_eks_cluster.eks_cluster.name

  addon_name    = "aws-ebs-csi-driver"
  addon_version = var.aws_ebs_csi_driver_version

  service_account_role_arn = aws_iam_role.csi_irsa_role.arn
  resolve_conflicts_on_create = "OVERWRITE"

#   depends_on = [
#     aws_eks_node_group.eks_node_group,
#   ]
}

# resource "aws_eks_addon" "eks_pod_identity_agent" {
#   cluster_name = aws_eks_cluster.eks_cluster.name
#
#   addon_name    = "eks-pod-identity-agent"
#   addon_version = var.eks_pod_identity_version
#
#   resolve_conflicts_on_create = "OVERWRITE"
#
#   depends_on = [
#     aws_eks_node_group.eks_node_group,
#   ]
# }