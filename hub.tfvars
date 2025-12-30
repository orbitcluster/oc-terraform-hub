env    = "dev"
bu_id  = "BU12345"
app_id = "APP67890"

# Network
vpc_cidr = "10.0.0.0/16"
azs      = ["us-east-1a", "us-east-1c"]

vpc_endpoints = {
  "s3"  = true
  "ssm" = true
}

min_size          = 1
max_size          = 2
desired_size      = 1
max_pods_per_node = 10

is_eks_managed_node_group = true

cluster_access_entries = {
  # IAM Role: OrbitClusterEKSAdmin
  "OrbitClusterEKSAdmin" = {
    principal_arn = "arn:aws:iam::485646919618:role/OrbitClusterEKSAdmin"
    type          = "STANDARD"

    policy_associations = {
      "ClusterAdmin" = {
        policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
        access_scope = {
          type = "cluster"
        }
      }
    }
  }
}
