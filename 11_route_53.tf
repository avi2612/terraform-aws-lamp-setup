resource "aws_route53_zone" "website_name" {
  name = var.hosted_zone_name

  tags = {
    Name = "dev"
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.website_name.zone_id
  name    = var.record_set_name
  type    = var.record_set_type
  ttl     = "300"
  records = [aws_eip.elastic_ip.public_ip]  # value
}
