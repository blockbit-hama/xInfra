resource "aws_iam_role" "role_xauth" {
  name               = "eks-${var.cluster_name}-xauth"
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
          "${local.openid_connect_provider_url}:sub": [
            "system:serviceaccount:x1:xauth"
          ]
        }
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "policy_eric_cli" {
  name   = "S3-FullAccess"
  role   = aws_iam_role.role_xauth.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}