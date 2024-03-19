# Kubernetes Addons Terraform Module

This Terraform module deploys the following components on AWS EKS:
- AWS ALB Ingress Controller as a Helm chart
- AWS IAM Authenticator configuration for EKS
- Cluster Autoscaler as a Helm chart

## Prerequisites
- Terraform installed
- AWS account and CLI configured
- kubectl installed
- Helm installed

## Usage

To use this module in your Terraform configuration, use the following syntax:

```hcl
module "kubernetes_addons" {
  source  = "path/to/module"

  env                           = var.env
  aws_region                    = var.aws_region
  eks_name                      = var.eks_name
  enable_cluster_autoscaler     = var.enable_cluster_autoscaler
  enable_alb_ingress_controller = var.enable_alb_ingress_controller
  cluster_autoscaler_helm_verion           = var.cluster_autoscaler_helm_verion
  eks_oidc_provider_arn         = var.eks_oidc_provider_arn
  alb_ingress_controller_helm_version      = var.alb_ingress_controller_helm_version
  openid_provider_arn           = var.openid_provider_arn
  nodes_role_arn                = var.nodes_role_arn
}
```

## Variables

The following variables are required:

- `env`: Environment name.
- `aws_region`: The AWS Region where resources will be created.
- `eks_name`: Name of the EKS cluster.
- `openid_provider_arn`: IAM OpenID Connect Provider ARN.
- `nodes_role_arn`: The EKS Node Role ARN.


The following variables are optional:

- `enable_cluster_autoscaler`: Set to true to deploy the Cluster Autoscaler.
- `enable_alb_ingress_controller`: Set to true to deploy the AWS ALB Ingress Controller Helm Chart.
- `cluster_autoscaler_helm_verion`: Version of the Cluster Autoscaler Helm chart.
- `alb_ingress_controller_helm_version`: Version of the AWS ALB Ingress Controller Helm chart.
