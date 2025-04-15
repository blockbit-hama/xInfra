# xauth
data "aws_iam_policy_document" "local_auth_policy_document" {
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
      aws_s3_bucket.local_auth.arn,
      "${aws_s3_bucket.local_auth.arn}/*"
    ]

    condition {
      test     = "StringNotEquals"
      variable = "aws:PrincipalArn"
      values   = var.s3_local_auth_access_arns
    }
  }
}

# public bank code
data "aws_iam_policy_document" "bank_code_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.s3_local_auth_access_arns
    }

    actions = [
      "s3:*"
    ]

    resources = [
      aws_s3_bucket.public_bank_code.arn,
      "${aws_s3_bucket.public_bank_code.arn}/*"
    ]
  }
}

# loki storage
data "aws_iam_policy_document" "loki_storage_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.s3_loki_storage_access_arns
    }

    actions = [
      "s3:*"
    ]

    resources = [
      aws_s3_bucket.loki_storage.arn,
      "${aws_s3_bucket.loki_storage.arn}/*"
    ]
  }
}

# mimir storage
data "aws_iam_policy_document" "mimir_storage_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.s3_mimir_storage_access_arns
    }

    actions = [
      "s3:*"
    ]

    resources = [
      aws_s3_bucket.mimir_storage.arn,
      "${aws_s3_bucket.mimir_storage.arn}/*"
    ]
  }
}

# tempo storage
data "aws_iam_policy_document" "tempo_storage_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.s3_tempo_storage_access_arns
    }

    actions = [
      "s3:*"
    ]

    resources = [
      aws_s3_bucket.tempo_storage.arn,
      "${aws_s3_bucket.tempo_storage.arn}/*"
    ]
  }
}