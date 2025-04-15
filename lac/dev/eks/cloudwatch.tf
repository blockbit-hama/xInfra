# resource "aws_cloudwatch_log_group" "eks_cluster_log" {
#   # The log group name format is /aws/eks/my-cluster/cluster.
#   # Reference: https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/control-plane-logs.html
#   name              = "/aws/eks/${var.cluster_name}/cluster"
#   retention_in_days = 7
# }