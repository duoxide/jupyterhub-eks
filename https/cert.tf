resource "kubernetes_secret" "jh" {
  metadata {
    name      = "jh-tls"
    namespace = "default"
  }

  data = {
    "tls.crt" = file("./cert/${var.cert_file}.cer")
    "tls.key" = file("./cert/${var.cert_file}.key")
  }

  type = "kubernetes.io/tls"
  depends_on = [
    module.eks
  ]
}