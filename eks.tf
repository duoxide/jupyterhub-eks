module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.30.3"
  
  cluster_name    = "aleksejs-cluster"
  cluster_version = "1.23"
  
  vpc_id     = aws_vpc.main.id
  subnet_ids = [for subnet in aws_subnet.main-public-1 : subnet.id]
  
   eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

    attach_cluster_primary_security_group = false

    # Disabling and using externally provided security groups
    create_security_group = false
  }

  eks_managed_node_groups = {
    one = {
      name = "allow-ssh"

      instance_types = ["t2.medium"]

      min_size     = 1
      max_size     = 3
      desired_size = 1

      pre_bootstrap_user_data = <<-EOT
      echo 'foo bar'
      EOT

      vpc_security_group_ids = [
        aws_security_group.allow-ssh.id
      ]
    }

    /* two = {
      name = "node-group-2"

      instance_types = ["t2.micro"]

      min_size     = 1
      max_size     = 2
      desired_size = 1

      pre_bootstrap_user_data = <<-EOT
      echo 'foo bar'
      EOT

      vpc_security_group_ids = [
        aws_security_group.node_group_two.id
      ]
    } */
  }
}

module "ebs-csi-driver" {
  source  = "DrFaust92/ebs-csi-driver/kubernetes"
  version = "3.3.1"
  oidc_url = module.eks.cluster_oidc_issuer_url
  depends_on = [module.eks]
}