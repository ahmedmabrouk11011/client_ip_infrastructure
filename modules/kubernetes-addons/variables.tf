variable "env" {
  description = "Environment name."
  type        = string
}

variable "aws_region" {
  description = "The AWS Region"
  type        = string
}

variable "eks_name" {
  description = "Name of the cluster."
  type        = string
}

variable "enable_cluster_autoscaler" {
  description = "Determines whether to deploy cluster autoscaler"
  type        = bool
  default     = false
}


variable "enable_alb_ingress_controller" {
  description = "Determines whether to deploy AWS ALB Ingress Controller Helm Chart"
  type        = bool
  default     = false
}

variable "cluster_autoscaler_helm_verion" {
  description = "Cluster Autoscaler Helm verion"
  type        = string
}


variable "eks_oidc_provider_arn" {
  type = string
}

variable "alb_ingress_controller_helm_version" {
  description = "AWS Application Loadbalancer ingress controller Helm verion"
  type        = string  
}

variable "openid_provider_arn" {
  description = "IAM Openid Connect Provider ARN"
  type        = string
}

variable "nodes_role_arn" {
  description = "The EKS Node Role ARN"
  type        = string
}