######################## VPC CNI ############################
resource "aws_iam_role" "cni_irsa_role" {
  name        = "eks-${var.cluster_name}-cni-plugin"
  description = "CNI plugin role for EKS cluster ${var.cluster_name}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "${local.openid_connect_provider_id}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${local.openid_connect_provider_url}:sub": "system:serviceaccount:kube-system:aws-node"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "cni_irsa_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.cni_irsa_role.name
}

######################## EBS CSI ############################
resource "aws_iam_role" "csi_irsa_role" {
  name        = "eks-${var.cluster_name}-csi-plugin"
  description = "CSI plugin role for EKS cluster ${var.cluster_name}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "${local.openid_connect_provider_id}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${local.openid_connect_provider_url}:aud": "sts.amazonaws.com",
          "${local.openid_connect_provider_url}:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "csi_irsa_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.csi_irsa_role.name
}