terraform {
  source = "../../../modules/rds"
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
  instance_class  = "db.t3.micro"
  subnet_ids      = dependency.vpc.outputs.db_subnet_ids
  vpc_id          = dependency.vpc.outputs.vpc_id
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_ids = [dependency.eks.outputs.eks_cluster_security_group_id]
  allocated_storage = 20
  storage_type = "gp2"

}

dependency "eks" {
  config_path = "../eks"

  mock_outputs = {
    eks_cluster_security_group_id = "sg-1231231231"
  }
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id = "vpc-12345"
    db_subnet_ids = ["subnet-1234", "subnet-5678"]
  }
}