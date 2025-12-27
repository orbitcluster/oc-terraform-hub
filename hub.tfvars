env          = "dev"
bu_id        = "BU12345"
app_id       = "APP67890"

# Network
vpc_cidr = "10.0.0.0/16"
azs      = ["us-east-1a", "us-east-1b"]

vpc_endpoints = {
  "s3" = true
  "ssm" = true
}
