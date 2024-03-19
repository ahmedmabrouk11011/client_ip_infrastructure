// remote_state {
//   backend = "local"
//   generate = {
//     path      = "backend.tf"
//     if_exists = "overwrite_terragrunt"
//   }

//   config = {
//     path = "${path_relative_to_include()}/terraform.tfstate"
//   }
// }

remote_state {
  backend = "s3"
  generate = {
    path      = "state.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    profile = "clientip-${dirname(path_relative_to_include())}"
    bucket = "clientip-${dirname(path_relative_to_include())}-tf-state"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "clientip-${dirname(path_relative_to_include())}-tf-state-lock"
    encrypt = true
  }
}


// generate "provider" {
//   path = "main.tf"
//   if_exists = "overwrite_terragrunt"

//   contents = <<EOF
//         provider "aws" {
//             region  = "us-east-1"
//             profile = "clientip-${dirname(path_relative_to_include())}"
//         }
//     EOF
// }




inputs = {
  # Common Project Tags
  tags = {
    Project = "ClientIP_Task"
    ManagedBy = "terraform"
  }

  # DB Default Variables
  name            = "clientip-db"
  db_name         = "task_db"
  engine = "postgres"
  engine_version = "16.1"
  username = "postgres"  
  parameter_group_family = "postgres16"
  db_port = "5432"  

  # EKS Common variables
  eks_version = "1.29"
  eks_name    = "client-ip"


  # EKS ALB Ingress Addon
  aws_region = "us-east-1"


  # ECR Name
  ecr_name = "clientip"
}

