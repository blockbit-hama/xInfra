output "route53_internal_zone_id" {
  value = aws_route53_zone.internal.zone_id
}

output "route53_internal_domain" {
  value = aws_route53_zone.internal.name
}