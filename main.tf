module "eks_setup" {
  source = "git::https://github.com/orbitcluster/oc-terraform-module-eks-setup.git?ref=23c8dee58d740c9ab0180893918416d78c7e52ab"

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
}
