# ECR Terraform Module

## Overview
This Terraform module creates an Elastic Container Registry (ECR) on AWS. 

It is designed to be flexible, allowing users to specify the environment, tags, and the name of the ECR repository.

## Prerequisites
- Terraform installed
- AWS account and CLI configured

## Usage
To use this module in your Terraform environment, add the following configuration:

```hcl
module "ecr" {
  source = "path/to/module"

  env      = "your-environment"
  tags     = {
    "Project"   = "Your Project Name"
    "Owner"     = "Your Name"
  }
  ecr_name = "your-ecr-name"
  enable_force_delete = true
  enable_image_tag_mutability = "MUTABLE"
}
```

Replace `path/to/your/module` with the actual path to your Terraform module.

## Variables

- `env`: Environment name.
- `tags`: Tags for the project.
- `ecr_name`: The name of the ECR Registry
- `enable_force_delete`: will delete the repository even if it contains images.
- `enable_image_tag_mutability`: The tag mutability setting for the repository.


## Outputs
The module provides the following outputs:

- `ecr_repository_url`: The URL of the created ECR repository

