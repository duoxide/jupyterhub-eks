data "kubernetes_service" "lb_dns" {
  metadata {
    name = "proxy-public"
  }
}

data "aws_elb_hosted_zone_id" "main" {}

resource "aws_route53_zone" "aleksejs" {
  name = "dioxide.id.lv"
  depends_on = [helm_release.jupyterhub]
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.aleksejs.zone_id
  name    = "jh.dioxide.id.lv"
  type    = "A"
  depends_on = [aws_route53_zone.aleksejs]

  alias {
    name                   = data.kubernetes_service.lb_dns.status[0].load_balancer[0].ingress[0].hostname
    zone_id                = data.aws_elb_hosted_zone_id.main.id
    evaluate_target_health = true
  }
}