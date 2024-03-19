### Description

This module will create an S3 bucket and dynamodb locking table for storing terraform state (remote backend).

### Information

The state for this "bootstrap_tfstate_backend" module will be stored locally. This state should be deleted after the resources are deployed and any amendments to the bootstrapped resources should be done manually.

### How to use?

1. Configure the configuration file **terraform-shared-bootstrap.tfvars** in the directory ./shared_environment/config/shared
2. From the module directory ( ./bootstrap_state) run the following commands:

Init :

```bash
terraform init -backend-config="terraform-dev-bootstrap.tfvars"
```

Apply/deploy the configuration

```bash
terraform apply -var-file "terraform-dev-bootstrap.tfvars" -state="./backend/dev/terraform-dev.tfstate"
```

destroy/delete the configuration

```bash
terraform destroy -var-file "terraform-dev-bootstrap.tfvars" -state="./backend/dev/terraform-dev.tfstate"
```

The state for the bucket and dynamodb will be saved locally, it's important that this tfstate file(s) are included in .gitignore or they can be removed permanently.