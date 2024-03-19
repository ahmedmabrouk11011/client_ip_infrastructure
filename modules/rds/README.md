# AWS RDS Terraform Module

## Overview
This Terraform module provisions an Amazon Relational Database Service (RDS) instance with associated resources for secure and efficient database management. The module creates:
- One RDS instance
- One RDS subnet group
- One security group
- A secret manager to store the database credentials

## Prerequisites
- Terraform installed
- AWS account and CLI configured

## Usage
To use this module, include it in your Terraform configuration with the required variables.

```hcl
module "aws_rds" {
  source = "path/to/your/module"

  env                = var.env
  tags               = var.tags
  allocated_storage  = var.allocated_storage
  storage_type       = var.storage_type
  engine             = var.engine
  engine_version     = var.engine_version
  instance_class     = var.instance_class
  name               = var.name
  db_name            = var.db_name
  username           = var.username
  subnet_ids         = var.subnet_ids
  vpc_id             = var.vpc_id
  cidr_blocks        = var.cidr_blocks
  db_port            = var.db_port
  parameter_group_name = var.parameter_group_name
}
```

Replace `path/to/your/module` with the actual path to your Terraform module.

## Variables

- `env`: Environment name.
- `tags`: Tags for the project.
- `allocated_storage`: The allocated storage in gigabytes.
- `storage_type`: The storage type of the RDS instance.
- `engine`: The database engine to use.
- `engine_version`: The engine version to use.
- `instance_class`: The instance type of the RDS instance.
- `name`: The name of the database to create when the DB instance is created.
- `db_name`: The name of the database to create when the DB instance is created.
- `username`: Username for the master DB user.
- `subnet_ids`: List of subnet IDs in different availability zones.
- `vpc_id`: The VPC ID for the security group and RDS instance.
- `cidr_blocks`: CIDR blocks allowed access to the RDS instance.
- `db_port`: The default RDS instance port.
- `parameter_group_name`: Name of the DB parameter group to associate.

## Outputs
The module provides the following outputs:

- `db_instance_endpoint`: The connection endpoint for the RDS instance.
- `db_instance_port`: The database port for the RDS instance.