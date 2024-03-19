# Terragrunt Infrastructure Deployment

## Overview
This Terragrunt project automates the deployment of essential infrastructure components for a client_IP task, including VPC, RDS, EKS, ECR, Kubernetes addons, and more.

## Cost Estimate
- The cost estimate is generated based on the configuration and usage details provided in the AWS Pricing Calculator. 
- It includes the pricing for various AWS services that we plan to use for this architecture solution.
- To view the detailed cost estimate, please visit the following link: [AWS Pricing Calculator Estimate](https://calculator.aws/#/estimate?id=85c617111b48e55303c93412b86b976404c42a81)

## Prerequisites
- Terragrunt
- Terraform
- AWS CLI
- kubectl (for Kubernetes interactions)
- helm

## Quick Start
To deploy the infrastructure, navigate to the environment directory and run the following command:


```bash
terragrunt run-all apply
```

To destroy the infrastructure, use:

```bash
terragrunt run-all destroy
```

Additionally you can force delete the secret from secret manager using the below command

```bash
aws secretsmanager delete-secret --secret-id ${ENV}/clientip-db/rds-credentials --force-delete-without-recovery
aws secretsmanager delete-secret --secret-id ${ENV}/cicd_user_keys --force-delete-without-recovery
```

