######################## EKS ########################################
resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-${var.cluster_name}-cluster-sg"
  description = "Cluster communication with Worker Nodes"
  vpc_id      = var.target_vpc

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = []
    self        = true
    description = ""
  }

  dynamic "ingress" {
    for_each = var.additional_ingress
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = ""
  }

  tags = merge(var.tags, tomap({
    "Name"                                      = "eks-${var.cluster_name}-cluster-sg",
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }))
}