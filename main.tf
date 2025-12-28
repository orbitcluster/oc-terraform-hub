  module "eks_hub" {
  source = "git::https://github.com/orbitcluster/oc-terraform-module-eks-setup.git?ref=535dcee38fea6d89b5a79692c72b19334b7ca852"

  # Basic VPC Info
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  # VPC Endpoints
  enable_vpc_endpoints = var.enable_vpc_endpoints
  vpc_endpoints        = var.vpc_endpoints

  # Common Tags & Info
  env    = var.env
  bu_id  = var.bu_id
  app_id = var.app_id

  # EKS Configuration
  min_size                   = var.min_size
  max_size                   = var.max_size
  desired_size               = var.desired_size
  max_pods_per_node          = var.max_pods_per_node
}
