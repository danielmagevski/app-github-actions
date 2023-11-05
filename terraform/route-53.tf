#resource "aws_route53_record" "this" {
#  name    = "app"
#  type    = "CNAME"
#  zone_id = "Z03401263USG3HK0BZ0JZ"
# records = [aws_lb.this.dns_name]
 # ttl     = "300"
#}