variable "iam_policy_arn" {
  default = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEKSServicePolicy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
  type    = list(string)
}

variable "availability_zones" {
  description = "Availability zones in this region to use"
  default     = ["eu-central-1a", "eu-central-1b"]
  type        = list(string)
}

variable "subnet_cidrs_public" {
  default = ["10.0.1.0/24", "10.0.3.0/24"]
  type    = list(string)
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "hosted_zone" {
  description = "Hosted zone for Route53"
  type        = string
  default     = "dioxide.id.lv"
}

variable "a_record" {
  description = "A record for jupyterhub access in Route53"
  type        = string
  default     = "jh.dioxide.id.lv"
}

variable "txt_record" {
  description = "TXT record for DNS challenge in Route53"
  type        = string
  default     = "_acme-challenge.jh.dioxide.id.lv"
}

variable "txt_record_value" {
  description = "TXT record value for DNS challenge in Route53"
  type        = string
  default     = "uPYDTuKs93ucONhEY_1nPGreMu74ilQn8nhWgSZ_XQY"
}