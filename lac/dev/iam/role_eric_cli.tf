resource "aws_iam_role" "role_eric_cli" {
  name               = "EricCLI"
  max_session_duration = 28800 # 8 hours in seconds
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::637423218787:user/eric-cli"
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

resource "aws_iam_role_policy" "policy_eric_cli" {
  name   = "S3-FullAccess"
  role   = aws_iam_role.role_eric_cli.id
  policy = <<EOF
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
EOF
}

resource "aws_iam_role_policy_attachment" "attach_eric_cli_ip_blocking_policy" {
  role       = aws_iam_role.role_eric_cli.name
  policy_arn = var.ip_blocking_policy_arn
}