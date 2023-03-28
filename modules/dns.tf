# Create public DNS record
resource "aws_route53_record" "public_dns" {
  zone_id         = var.zone_id
  name            = var.dns_name
  ttl             = 300
  type            = "CNAME"
  records         = aws_alb.alb.dns_name
}
