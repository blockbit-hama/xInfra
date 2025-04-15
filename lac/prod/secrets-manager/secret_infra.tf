resource "aws_secretsmanager_secret" "secret_infra" {
  name = var.infra_secret_name
  description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component, e.g., 'dev/infra'"
}

data "aws_iam_policy_document" "policy_secret_infra" {
  statement {
    sid    = "AllowAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.secret_access_arns
    }

    actions   = ["secretsmanager:*"]
    resources = ["*"]
  }
}

resource "aws_secretsmanager_secret_policy" "secret_policy_infra" {
  secret_arn = aws_secretsmanager_secret.secret_infra.arn
  policy     = data.aws_iam_policy_document.policy_secret_infra.json
}
