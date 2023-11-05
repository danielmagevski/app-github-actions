resource "aws_route53_record" "this" {
  name    = "swarm-lb-dns-cname"
  type    = "CNAME"
  zone_id = "Z03401263USG3HK0BZ0JZ" # Substitua pelo ID da zona DNS

  records = [aws_lb.this.dns_name]
  ttl     = "300"
}