# EKS Terraform Module

## Overview
This Terraform module creates an Amazon Elastic Kubernetes Service (EKS) cluster with the necessary configurations and resources. It simplifies the setup of an EKS cluster and includes the following features:
- EKS Cluster creation
- Node IAM Policies attachment
- Node Groups configuration
- OpenID Connect Provider for EKS to enable IAM Roles for Service Accounts (IRSA)

## Prerequisites
- Terraform installed
- AWS account and CLI configured

## Usage
To use this module, include it in your Terraform configuration with the required variables.

```hcl
module "eks_cluster" {
  source = "path/to/your/module"

  env              = var.env
  tags             = var.tags
  eks_version      = var.eks_version
  eks_name         = var.eks_name
  subnet_ids       = var.subnet_ids
  node_iam_policies = var.node_iam_policies
  node_groups      = var.node_groups
  enable_irsa      = var.enable_irsa
}
```

Replace `path/to/your/module` with the actual path to your Terraform module.

## Variables

- `env`: Environment name.
- `tags`: Tags for the project.
- `eks_version`: Desired Kubernetes master version.
- `eks_name`: Name of the cluster.
- `subnet_ids`: List of subnet IDs in different availability zones.
- `node_iam_policies`: IAM Policies to attach to EKS-managed nodes.
- `node_groups`: EKS node groups.
- `enable_irsa`: Flag to create an OpenID Connect Provider for EKS to enable IRSA.


## Outputs

The module provides the following outputs:

- `eks_name`: The name of the created EKS cluster.
- `eks_endpoint`: The endpoint for the EKS cluster.
- `kubeconfig-certificate-authority-data`: The certificate authority data for the EKS cluster.
- `openid_provider_arn`: The ARN for the OpenID Connect Provider.