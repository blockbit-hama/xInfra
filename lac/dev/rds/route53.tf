# Route53 Record for Primary DB endpoint
resource "aws_route53_record" "dev_custella_db" {
  zone_id = var.route53_internal_zone_id
  name    = "dev-db.${var.route53_internal_domain}"
  type    = "CNAME"
  ttl     = 300
  records = [aws_db_instance.postgres.address]
}