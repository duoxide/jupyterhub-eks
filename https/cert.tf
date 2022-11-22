resource "kubernetes_secret" "jh" {
  metadata {
    name      = "jh-tls"
    namespace = "default"
  }

  data = {
    "tls.crt" = file("./cert/jh.dioxide.id.lv.cer")
    "tls.key" = file("./cert/jh.dioxide.id.lv.key")
  }

  type = "kubernetes.io/tls"
  depends_on = [
    module.eks
  ]
}