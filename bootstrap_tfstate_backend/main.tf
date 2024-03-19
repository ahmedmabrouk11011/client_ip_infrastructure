terraform {
  required_version = ">=1.3.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.39.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

data "aws_region" "aws_region_current" {}

data "aws_caller_identity" "aws_account_current" {}

resource "aws_s3_bucket" "s3_terraform_state" {
  bucket = var.bucket_state_name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  dynamic "logging" {
    for_each = var.s3_logging_enabled ? [1] : []
    content {
      target_bucket = aws_s3_bucket.s3_terraform_state_log[0].id
      target_prefix = var.s3_log_prefix
    }
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_s3_bucket_public_access_block" "blockbucket-state" {

  bucket = aws_s3_bucket.s3_terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true

  depends_on = [
    aws_s3_bucket.s3_terraform_state
  ]

}

resource "aws_s3_bucket" "s3_terraform_state_log" {
  count = var.s3_logging_enabled ? 1 : 0

  bucket = "${var.bucket_state_name}-log"
  acl    = "private"


  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_s3_bucket_public_access_block" "blockbucket-state-logs" {
  count  = var.s3_logging_enabled ? 1 : 0
  bucket = aws_s3_bucket.s3_terraform_state_log[0].id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true

  depends_on = [
    aws_s3_bucket.s3_terraform_state_log[0]
  ]

}

resource "aws_dynamodb_table" "table_locking_terraform_state" {

  name = var.dynamodb_table_state_locking_name

  dynamic "server_side_encryption" {
    for_each = var.dynamodb_enabled_encryption ? [1] : []
    content {
      enabled = true
    }
  }

  dynamic "point_in_time_recovery" {
    for_each = var.dynamodb_point_intime_recovery_enabled ? [1] : []
    content {
      enabled = true
    }
  }

  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}
