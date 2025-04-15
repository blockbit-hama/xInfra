resource "aws_iam_role" "role_ecr_access" {
  name               = "ECRAccess"
  max_session_duration = 43200 # 12 hours in seconds
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": [
              "arn:aws:iam::637423218787:user/dante-cli",
              "arn:aws:iam::637423218787:user/brad-cli"
              ]
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

resource "aws_iam_role_policy" "policy_ecr_access" {
  name   = "ECRAccess"
  role   = aws_iam_role.role_ecr_access.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "ecr:GetAuthorizationToken",
            "Resource": "*"
        }
    ]
}
EOF
}