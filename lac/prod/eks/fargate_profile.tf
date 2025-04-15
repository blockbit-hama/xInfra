resource "aws_eks_fargate_profile" "eks_fargate_profile" {
  cluster_name           = var.cluster_name
  fargate_profile_name   = "fargate-coredns"
  pod_execution_role_arn = aws_iam_role.eks_fargate.arn
  subnet_ids             = var.private_subnet_zone_a_ids

  selector {
    namespace = "kube-system"
    labels = {
      "k8s-app" = "kube-dns"
    }
  }
}

resource "aws_eks_fargate_profile" "eks_fargate_karpenter" {
  cluster_name           = var.cluster_name
  fargate_profile_name   = "fargate-karpenter"
  pod_execution_role_arn = aws_iam_role.eks_fargate.arn
  subnet_ids             = var.private_subnet_zone_a_ids

  selector {
    namespace = "karpenter"
    labels = {
      "app.kubernetes.io/name" = "karpenter"
    }
  }
}

resource "aws_iam_role" "eks_fargate" {
  name = "eks-${var.cluster_name}-fargateProfile"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "eks-fargate-pods.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSFargatePodExecutionRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.eks_fargate.name
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_fargate.name
}