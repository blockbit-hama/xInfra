resource "aws_iam_role" "external_secrets_role" {
  name               = "eks-${var.cluster_name}-external-secrets"
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
            "system:serviceaccount:external-secrets:external-secrets",
            "system:serviceaccount:x1:xauth-external-secrets",
            "system:serviceaccount:x1:xbank",
            "system:serviceaccount:x1:xfds",
            "system:serviceaccount:x1:xboa",
            "system:serviceaccount:x1:xbank",
            "system:serviceaccount:x1:xprobe",
            "system:serviceaccount:x1:xbo-front",
            "system:serviceaccount:x1:alt-shift-front",
            "system:serviceaccount:argocd:external-secrets",
            "system:serviceaccount:kube-system:aws-node-termination-handler-external-secrets",
            "system:serviceaccount:monitoring:grafana-external-secrets",
            "system:serviceaccount:keycloak:keycloak-external-secrets"
          ]
        }
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "policy_external_secrets" {
  name   = "ExternalSecretsOperator"
  role   = aws_iam_role.external_secrets_role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "secretsmanager:GetResourcePolicy",
                "secretsmanager:GetSecretValue",
                "secretsmanager:DescribeSecret",
                "secretsmanager:ListSecretVersionIds",
                "kms:GetParametersForImport",
                "kms:GetPublicKey",
                "kms:ListKeyPolicies",
                "kms:ListRetirableGrants",
                "kms:GetKeyRotationStatus",
                "kms:GetKeyPolicy",
                "kms:DescribeKey",
                "kms:ListResourceTags",
                "kms:ListGrants",
                "kms:GenerateDataKey",
                "kms:Encrypt",
                "kms:Decrypt"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}