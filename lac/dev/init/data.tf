data "aws_iam_policy_document" "tfstate_policy_document" {
  statement {
    effect = "Deny"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:*"
    ]

    resources = [
      aws_s3_bucket.tfstate.arn,
      "${aws_s3_bucket.tfstate.arn}/*"
    ]

    condition {
      test     = "StringNotEquals"
      variable = "aws:PrincipalArn"
      values   = [
        "arn:aws:iam::637423218787:role/MFARequiredAdministratorRole",
        "arn:aws:iam::637423218787:user/dante"
      ]
    }
  }
}