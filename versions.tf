terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.15.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.35.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.16.0"
    }
  }
}

# Kubernetes provider configuration for EKS
provider "kubernetes" {
  host                   = module.eks_setup.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_setup.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks_setup.cluster_name]
  }
}

# Helm provider configuration for EKS
provider "helm" {
  kubernetes =  {
    host                   = module.eks_setup.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks_setup.cluster_certificate_authority_data)

    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.eks_setup.cluster_name]
    }
  }
}
