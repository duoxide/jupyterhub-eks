data "aws_elb_hosted_zone_id" "main" {}

resource "aws_route53_zone" "aleksejs" {
  name = "dioxide.id.lv"
}

resource "aws_route53_record" "www" {
  zone_id    = aws_route53_zone.aleksejs.zone_id
  name       = "jh.dioxide.id.lv"
  type       = "A"
  depends_on = [aws_route53_zone.aleksejs, helm_release.jupyterhub]

  alias {
    name                   = data.kubernetes_service.lb_dns.status[0].load_balancer[0].ingress[0].hostname
    zone_id                = data.aws_elb_hosted_zone_id.main.id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "dns_challenge" {
  zone_id    = aws_route53_zone.aleksejs.zone_id
  name       = "_acme-challenge.jh.dioxide.id.lv"
  type       = "TXT"
  ttl        = 300
  records    = ["uPYDTuKs93ucONhEY_1nPGreMu74ilQn8nhWgSZ_XQY"]
  depends_on = [aws_route53_zone.aleksejs, helm_release.jupyterhub]

}