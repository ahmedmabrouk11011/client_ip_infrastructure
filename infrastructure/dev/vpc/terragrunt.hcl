terraform {
  source = "../../../modules/vpc"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  env             = include.env.locals.env
  vpc_cidr_block  = "10.20.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.20.10.0/24", "10.20.11.0/24"]
  public_subnets  = ["10.20.20.0/24", "10.20.21.0/24"]
  db_subnets      = ["10.20.30.0/24", "10.20.31.0/24"]
  
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/dev-client-ip-eks"  = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"         = 1
    "kubernetes.io/cluster/dev-client-ip-eks" = "owned"
  }
}