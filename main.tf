module "eks_setup" {
  source = "git::https://github.com/orbitcluster/oc-terraform-module-eks-setup.git?ref=7ae662253c438c7845dfbefaa8bfd4b90005b3ef"

  # Basic VPC Info
  vpc_cidr = var.vpc_cidr
  azs      = var.azs
  # VPC Endpoints
  enable_vpc_endpoints = var.enable_vpc_endpoints
  vpc_endpoints        = var.vpc_endpoints

  # Common Tags & Info
  env    = var.env
  bu_id  = var.bu_id
  app_id = var.app_id

  # EKS Configuration
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_size              = var.desired_size
  max_pods_per_node         = var.max_pods_per_node
  is_eks_managed_node_group = var.is_eks_managed_node_group
}
