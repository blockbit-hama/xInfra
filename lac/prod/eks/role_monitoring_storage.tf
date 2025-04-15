resource "aws_iam_role" "role_monitoring_storage" {
  name               = "eks-${var.cluster_name}-monitoring-storage"
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
                        "system:serviceaccount:monitoring:loki-storage",
                        "system:serviceaccount:monitoring:tempo-storage",
                        "system:serviceaccount:monitoring:mimir-storage"
                    ]
                }
            }
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy" "policy_monitoring_storage" {
  name   = "MonitoringStorage"
  role   = aws_iam_role.role_monitoring_storage.id
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "LokiStorage",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:GetObjectTagging",
                "s3:PutObjectTagging"
            ],
            "Resource": [
                "${var.loki_storage_arn}",
                "${var.loki_storage_arn}/*",
                "${var.tempo_storage_arn}",
                "${var.tempo_storage_arn}/*",
                "${var.mimir_storage_arn}",
                "${var.mimir_storage_arn}/*"
            ]
        }
    ]
}
POLICY
}