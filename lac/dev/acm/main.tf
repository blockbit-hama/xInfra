resource "aws_acm_certificate" "cert" {
  domain_name       = var.fully_qualified_domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}