output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  value = var.region
}

output "cluster_name" {
  value = "aleksejs-cluster"
}

output "elb_dns" {
  value = data.kubernetes_service.lb_dns.status[0].load_balancer[0].ingress[0].hostname
}

output "elb_zid" {
  value = data.aws_elb_hosted_zone_id.main.id
}

output "zone_rec" {
  value = aws_route53_zone.aleksejs.name_servers
}

output "zone_id" {
  value = aws_route53_zone.aleksejs.zone_id
}