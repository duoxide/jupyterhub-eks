# Helm provider installs in Kubernetes cluster

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.cluster.name]
      command     = "aws"
    }
  }
}

resource "helm_release" "jupyterhub" {
  name       = "jupyterhub-deploy"
  chart      = "https://jupyterhub.github.io/helm-chart/jupyterhub-2.0.0.tgz"
  depends_on = [module.eks, module.ebs-csi-driver, aws_internet_gateway.main-gw]
  /* values = [
    "${file("https.yaml")}"
  ] */
  values = [
    templatefile("http.yaml", { host = "${var.a_record}", git_id = "${var.git_id}", git_secret = "${var.git_secret}" })
  ]
}

resource "helm_release" "ca" {
  name       = "ca-deploy"
  chart      = "https://github.com/kubernetes/autoscaler/releases/download/cluster-autoscaler-chart-9.21.0/cluster-autoscaler-9.21.0.tgz"
  depends_on = [module.eks, module.ebs-csi-driver, helm_release.jupyterhub]
  /* values = [
    "${file("ca.yaml")}"
  ] */
  values = [
    templatefile("ca.yaml", { cl_name = "${var.cluster_name}", aws_ak_id = "${var.aws_ak_id}", aws_ak_secret = "${var.aws_ak_secret}" })
  ]
}