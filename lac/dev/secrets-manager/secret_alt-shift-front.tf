# resource "aws_secretsmanager_secret" "secret_alt_shift_front" {
#   name = var.alt_shift_front_secret_name
#   description = "The name of the secret in AWS Secrets Manager used by the infrastructure in various environments. It follows the pattern environment/component"
# }
#
# data "aws_iam_policy_document" "policy_secret_alt_shift_front" {
#   statement {
#     sid    = "AllowAccess"
#     effect = "Allow"
#
#     principals {
#       type        = "AWS"
#       identifiers = var.secret_access_arns
#     }
#
#     actions   = ["secretsmanager:*"]
#     resources = ["*"]
#   }
# }
#
# resource "aws_secretsmanager_secret_policy" "secret_policy_alt_shift_front" {
#   secret_arn = aws_secretsmanager_secret.secret_alt_shift_front.arn
#   policy     = data.aws_iam_policy_document.policy_secret_alt_shift_front.json
# }
