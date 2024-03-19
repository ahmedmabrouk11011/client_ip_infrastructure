locals {
    env = "dev"
}

generate "provider" {
  path = "main.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
        provider "aws" {
            region  = "us-east-1"
            profile = "clientip-dev"
        }
    EOF
}