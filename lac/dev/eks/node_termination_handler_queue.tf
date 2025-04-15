locals {
  handler_name = "${var.cluster_name}-aws-node-termination-handler"
}

# Define the EventBridge rules individually
locals {
  spot_terminate_event_rule = {
    name = "aws-node-termination-handler-spot-terminate"
    event_pattern = {
      source      = ["aws.ec2"]
      detail-type = ["EC2 Spot Instance Interruption Warning"]
    }
  }

  rebalance_recommendation_event_rule = {
    name = "aws-node-termination-handler-rebalance-recommendation"
    event_pattern = {
      source      = ["aws.ec2"]
      detail-type = ["EC2 Instance Rebalance Recommendation"]
    }
  }

  health_check_event_rule = {
    name = "aws-node-termination-handler-health-check"
    event_pattern = {
      source      = ["aws.health"]
      detail-type = ["AWS Health Event"]
      detail = {
        service           = ["EC2"],
        eventTypeCategory = ["scheduledChange"]
      }
    }
  }

#   state_change_event_rule = {
#     name = "aws-node-termination-handler-state-change"
#     event_pattern = {
#       source      = ["aws.ec2"]
#       detail-type = ["EC2 Instance State-change Notification"]
#     }
#   }
}

# SQS Queue
resource "aws_sqs_queue" "aws_node_termination_handler_queue" {
  name                      = "${local.handler_name}-queue"
  sqs_managed_sse_enabled   = true
  message_retention_seconds = 43200
  tags = merge(var.tags, tomap({
    Name = "${local.handler_name}-queue"
  }))
}

resource "aws_sqs_queue_policy" "aws_node_termination_handler_queue_policy" {
  queue_url = aws_sqs_queue.aws_node_termination_handler_queue.id
  policy    = <<-EOF
{
    "Version": "2012-10-17",
    "Id": "MyQueuePolicy",
    "Statement": [{
        "Effect": "Allow",
        "Principal": {
            "Service": ["events.amazonaws.com", "sqs.amazonaws.com"]
        },
        "Action": "sqs:SendMessage",
        "Resource": [
            "${aws_sqs_queue.aws_node_termination_handler_queue.arn}"
        ]
    }]
}
EOF
}

# EventBridge Rules
resource "aws_cloudwatch_event_rule" "spot_terminate" {
  name          = local.spot_terminate_event_rule.name
  event_pattern = jsonencode(local.spot_terminate_event_rule.event_pattern)
}

resource "aws_cloudwatch_event_rule" "rebalance_recommendation" {
  name          = local.rebalance_recommendation_event_rule.name
  event_pattern = jsonencode(local.rebalance_recommendation_event_rule.event_pattern)
}

resource "aws_cloudwatch_event_rule" "health_check" {
  name          = local.health_check_event_rule.name
  event_pattern = jsonencode(local.health_check_event_rule.event_pattern)
}

# resource "aws_cloudwatch_event_rule" "state_change" {
#   name          = local.state_change_event_rule.name
#   event_pattern = jsonencode(local.state_change_event_rule.event_pattern)
# }

# EventBridge Targets
resource "aws_cloudwatch_event_target" "spot_terminate_target" {
  rule = aws_cloudwatch_event_rule.spot_terminate.name
  arn  = aws_sqs_queue.aws_node_termination_handler_queue.arn

  depends_on = [
    aws_sqs_queue.aws_node_termination_handler_queue,
    aws_cloudwatch_event_rule.spot_terminate
  ]
}

resource "aws_cloudwatch_event_target" "rebalance_recommendation_target" {
  rule = aws_cloudwatch_event_rule.rebalance_recommendation.name
  arn  = aws_sqs_queue.aws_node_termination_handler_queue.arn

  depends_on = [
    aws_sqs_queue.aws_node_termination_handler_queue,
    aws_cloudwatch_event_rule.rebalance_recommendation
  ]
}

resource "aws_cloudwatch_event_target" "health_check_target" {
  rule = aws_cloudwatch_event_rule.health_check.name
  arn  = aws_sqs_queue.aws_node_termination_handler_queue.arn

  depends_on = [
    aws_sqs_queue.aws_node_termination_handler_queue,
    aws_cloudwatch_event_rule.health_check
  ]
}

# resource "aws_cloudwatch_event_target" "state_change_target" {
#   rule = aws_cloudwatch_event_rule.state_change.name
#   arn  = aws_sqs_queue.aws_node_termination_handler_queue.arn
#
#   depends_on = [
#     aws_sqs_queue.aws_node_termination_handler_queue,
#     aws_cloudwatch_event_rule.state_change
#   ]
# }

# IAM Role for "aws_node_termination_handler" Pod
resource "aws_iam_role" "aws_node_termination_handler" {
  name               = "eks-${local.handler_name}"
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
                    "${local.openid_connect_provider_url}:sub": "system:serviceaccount:kube-system:aws-node-termination-handler"
                }
            }
        }
    ]
}
POLICY
}

resource "aws_iam_policy" "aws_node_termination_handler_policy" {
  name   = "eks-${local.handler_name}-policy"
  policy = <<-EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "autoscaling:CompleteLifecycleAction",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeTags",
                "ec2:DescribeInstances",
                "sqs:DeleteMessage",
                "sqs:ReceiveMessage"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "aws_node_termination_handler_attachment" {
  policy_arn = aws_iam_policy.aws_node_termination_handler_policy.arn
  role       = aws_iam_role.aws_node_termination_handler.name
}
