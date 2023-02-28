data "aws_elb_hosted_zone_id" "main" {}

resource "aws_route53_zone" "jupyterhub" {
  name = var.hosted_zone
}

resource "aws_route53_record" "www" {
  zone_id    = aws_route53_zone.jupyterhub.zone_id
  name       = var.a_record
  type       = "A"
  depends_on = [aws_route53_zone.jupyterhub, helm_release.jupyterhub]

  alias {
    name                   = data.kubernetes_service.lb_dns.status[0].load_balancer[0].ingress[0].hostname
    zone_id                = data.aws_elb_hosted_zone_id.main.id
    evaluate_target_health = true
  }
}

/* resource "aws_route53_record" "dns_challenge" {
  zone_id    = aws_route53_zone.jupyterhub.zone_id
  name       = var.txt_record
  type       = "TXT"
  ttl        = 300
  records    = [var.txt_record_value]
  depends_on = [aws_route53_zone.jupyterhub, helm_release.jupyterhub]

} */