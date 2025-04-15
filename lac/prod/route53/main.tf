# Private DNS
resource "aws_route53_zone" "internal" {
  name    = var.internal_domain
  comment = "${var.vpc_name} - Managed by Terraform"

  vpc {
    vpc_id = var.vpc_id
  }
}