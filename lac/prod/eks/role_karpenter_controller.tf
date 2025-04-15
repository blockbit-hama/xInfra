## karpenter controller
resource "aws_iam_role" "karpenter_controller" {
  name               = "eks-${var.cluster_name}-karpenter-controller"
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
                    "${local.openid_connect_provider_url}:sub": "system:serviceaccount:karpenter:karpenter"
                }
            }
        }
    ]
}
POLICY
}

resource "aws_iam_policy" "karpenter_controller" {
  name   = "eks-${var.cluster_name}-karpenter-controller-policy"
  policy = <<-EOF
{
    "Statement": [
        {
            "Action": [
                "ssm:GetParameter",
                "ec2:DescribeImages",
                "ec2:RunInstances",
                "ec2:DescribeSubnets",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeLaunchTemplates",
                "ec2:DescribeInstances",
                "ec2:DescribeInstanceTypes",
                "ec2:DescribeInstanceTypeOfferings",
                "ec2:DescribeAvailabilityZones",
                "ec2:DeleteLaunchTemplate",
                "ec2:CreateTags",
                "ec2:CreateLaunchTemplate",
                "ec2:CreateFleet",
                "ec2:DescribeSpotPriceHistory",
                "pricing:GetProducts"
            ],
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "Karpenter"
        },
        {
            "Action": "ec2:TerminateInstances",
            "Condition": {
                "StringLike": {
                    "ec2:ResourceTag/karpenter.sh/nodepool": "*"
                }
            },
            "Effect": "Allow",
            "Resource": "*",
            "Sid": "ConditionalEC2Termination"
        },
        {
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": "${aws_iam_role.karpenter_node.arn}",
            "Sid": "PassNodeIAMRole"
        },
        {
            "Effect": "Allow",
            "Action": "eks:DescribeCluster",
            "Resource": "${aws_eks_cluster.eks_cluster.arn}",
            "Sid": "EKSClusterEndpointLookup"
        },
        {
            "Sid": "AllowScopedInstanceProfileCreationActions",
            "Effect": "Allow",
            "Resource": "*",
            "Action": [
            "iam:CreateInstanceProfile"
            ],
            "Condition": {
            "StringEquals": {
                "aws:RequestTag/kubernetes.io/cluster/${aws_eks_cluster.eks_cluster.name}": "owned",
                "aws:RequestTag/topology.kubernetes.io/region": "${var.region}"
            },
            "StringLike": {
                "aws:RequestTag/karpenter.k8s.aws/ec2nodeclass": "*"
            }
            }
        },
        {
            "Sid": "AllowScopedInstanceProfileTagActions",
            "Effect": "Allow",
            "Resource": "*",
            "Action": [
            "iam:TagInstanceProfile"
            ],
            "Condition": {
            "StringEquals": {
                "aws:ResourceTag/kubernetes.io/cluster/${aws_eks_cluster.eks_cluster.name}": "owned",
                "aws:ResourceTag/topology.kubernetes.io/region": "${var.region}",
                "aws:RequestTag/kubernetes.io/cluster/${aws_eks_cluster.eks_cluster.name}": "owned",
                "aws:RequestTag/topology.kubernetes.io/region": "${var.region}"
            },
            "StringLike": {
                "aws:ResourceTag/karpenter.k8s.aws/ec2nodeclass": "*",
                "aws:RequestTag/karpenter.k8s.aws/ec2nodeclass": "*"
            }
            }
        },
        {
            "Sid": "AllowScopedInstanceProfileActions",
            "Effect": "Allow",
            "Resource": "*",
            "Action": [
            "iam:AddRoleToInstanceProfile",
            "iam:RemoveRoleFromInstanceProfile",
            "iam:DeleteInstanceProfile"
            ],
            "Condition": {
            "StringEquals": {
                "aws:ResourceTag/kubernetes.io/cluster/${aws_eks_cluster.eks_cluster.name}": "owned",
                "aws:ResourceTag/topology.kubernetes.io/region": "${var.region}"
            },
            "StringLike": {
                "aws:ResourceTag/karpenter.k8s.aws/ec2nodeclass": "*"
            }
            }
        },
        {
            "Sid": "AllowInstanceProfileReadActions",
            "Effect": "Allow",
            "Resource": "*",
            "Action": "iam:GetInstanceProfile"
        }
    ],
    "Version": "2012-10-17"
}
EOF
}

resource "aws_iam_role_policy_attachment" "karpenter_controller" {
  role       = aws_iam_role.karpenter_controller.name
  policy_arn = aws_iam_policy.karpenter_controller.arn
}


# tags for security group
data "aws_security_group" "cluster_sg" {
  tags = tomap({
    "aws:eks:cluster-name" = var.cluster_name
  })
  depends_on = [aws_eks_cluster.eks_cluster]
}

resource "aws_ec2_tag" "karpenter_cluster_sg_tag" {
  resource_id = data.aws_security_group.cluster_sg.id
  key         = "karpenter.sh/discovery"
  value       = var.cluster_name
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_iam_service_linked_role" "spot" {
  aws_service_name = "spot.amazonaws.com"
}