# resource "aws_eks_node_group" "eks_node_group" {
#   cluster_name    = aws_eks_cluster.eks_cluster.name
#   node_group_name = "${var.cluster_name}-ng"
#   node_role_arn   = aws_iam_role.eks_node_group_role.arn
#   subnet_ids      = var.cluster_subnet_ids
#
#   ami_type        = var.node_group_ami_type
#   capacity_type   = "ON_DEMAND"
#   disk_size       = 30
#   instance_types  = ["t3.medium"]
#   version         = aws_eks_cluster.eks_cluster.version
#   release_version = var.node_group_release_version
#
#   tags = merge(var.tags, tomap({
#     "Name"                                      = "${var.cluster_name}-ng",
#     "kubernetes.io/cluster/${var.cluster_name}" = "owned"
#   }))
#
#   scaling_config {
#     desired_size = 2
#     max_size     = 3
#     min_size     = 2
#   }
#
#   update_config {
#     max_unavailable = 1
#   }
#
#   # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
#   # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
#   depends_on = [
#     aws_iam_role_policy_attachment.eks_node_AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.eks_node_AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.eks_node_AmazonEC2ContainerRegistryReadOnly
#   ]
#
#   # Optional: Allow external changes without Terraform plan difference
#   lifecycle {
# #     ignore_changes = [
# #       scaling_config[0].min_size,
# #       scaling_config[0].desired_size,
# #       scaling_config[0].max_size
# #     ]
#   }
# }