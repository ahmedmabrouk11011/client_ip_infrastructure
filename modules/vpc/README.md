# AWS VPC Terraform Module

## Overview
This Terraform module provisions a Virtual Private Cloud (VPC) in AWS with the following resources:
- One VPC
- Two public subnets
- Two private subnets
- Two DB subnets
- One Internet Gateway
- One NAT Gateway

## Prerequisites
- Terraform installed
- AWS account and CLI configured

## Usage
To use this module, include it in your Terraform configuration with the required variables.

```hcl
module "aws_vpc" {
  source = "path/to/your/module"

  env             = var.env
  tags            = var.tags
  vpc_cidr_block  = var.vpc_cidr_block
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  db_subnets      = var.db_subnets
  private_subnet_tags = var.private_subnet_tags
  public_subnet_tags  = var.public_subnet_tags
}
```

Replace `path/to/your/module` with the actual path to your Terraform module.

## Variables

- `env`: Environment name.
- `tags`: Tags for the project.
- `vpc_cidr_block`: CIDR block for the VPC. Default is 10.0.0.0/16.
- `azs`: Availability zones for subnets.
- `private_subnets`: CIDR ranges for private subnets.
- `public_subnets`: CIDR ranges for public subnets.
- `db_subnets`: CIDR ranges for DB subnets.
- `private_subnet_tags`: Tags for private subnets.
- `public_subnet_tags`: Tags for public subnets.

## Outputs

The module will output the following:
- `vpc_id`: The VPC ID
- `private_subnet_ids`: The list of the private subnet ids
- `public_subnet_ids`: The list of the public subnet ids
- `db_subnet_ids`: The list of the databae subnet ids

