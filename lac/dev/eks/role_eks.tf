######################## EKS ############################
resource "aws_iam_role" "eks_cluster_role" {
  name               = "eks-${var.cluster_name}"
  description        = "Allows access to other AWS service resources that are required to operate clusters managed by EKS."
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }

  dynamic "statement" {
    for_each = var.cluster_policy_list
    content {
      effect = "Allow"
      principals {
        type        = statement.value.type
        identifiers = statement.value.identifier
      }
      actions = ["sts:AssumeRole"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_cluster_role.name
}