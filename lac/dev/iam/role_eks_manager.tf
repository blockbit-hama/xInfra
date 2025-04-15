resource "aws_iam_role" "role_eks_manager" {
  name               = "EKSManager"
  max_session_duration = 28800 # 8 hours in seconds
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${var.eks_manager_arn}"
            },
            "Action": "sts:AssumeRole",
            "Condition": {
                "Bool": {
                    "aws:MultiFactorAuthPresent": "true"
                }
            }
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "policy_eks_manager" {
  name   = "eks-manager"
  role   = aws_iam_role.role_eks_manager.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeSpotPriceHistory",
                "eks:*",
                "sts:AssumeRoleWithWebIdentity",
                "pricing:GetProducts"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_ip_blocking_policy" {
  role       = aws_iam_role.role_eks_manager.name
  policy_arn = var.ip_blocking_policy_arn
}