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