# Terraform Project for Task Infrastructure

## Overview
This project contains Terraform modules for deploying task infrastructure. 

It includes a bootstrap process for setting up an S3 bucket and DynamoDB table to manage Terraform state.

## Structure
- `/modules`: Contains reusable Terraform modules.
- `/bootstrap_tfstate_backend`: Contains instructions to set up the Terraform backend.
- `/infrastructure`: Contains Terragrunt configurations for deploying infrastructure.

## Prerequisites
- Terraform installed
- AWS CLI configured
- Terragrunt installed

## Bootstrapping the Backend
Before deploying the infrastructure, you must bootstrap the Terraform backend. 

Navigate to the `bootstrap_tfstate_backend` folder and follow the README instructions to create the S3 bucket and DynamoDB table.

## Configuring Terragrunt
After bootstrapping the backend, update the Terragrunt configurations in the `infrastructure` folder as necessary. 

Ensure that the backend configuration matches the newly created resources.

## Deploying the Infrastructure
Navigate to the `infrastructure` folder and follow the README instructions to deploy your task infrastructure using Terragrunt.

## Commands
- To initialize the Terraform backend:

```bash
git clone https://github.com/ahmedmabrouk11011/client_ip_infrastructure.git
cd client_ip_infrastructure/infrastructure
```

```bash
terragrunt run-all init
```
- To plan the deployment:
```bash
terragrunt run-all plan
```

- To apply the changes:
```bash
terragrunt run-all apply
```

- To destroy the infrastructure:
```bash
terragrunt run-all destroy
```
