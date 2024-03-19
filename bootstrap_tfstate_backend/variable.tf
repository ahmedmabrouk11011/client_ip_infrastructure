
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "aws_profile" {
  description = "AWS profile"
  type        = string
}

variable "tags" {
  description = "Tags to use"
  type        = map(string)
}

variable "bucket_state_name" {
  description = "The name of the bucket for the Terraform state"
  type        = string
}


variable "s3_logging_enabled" {
    description = "When set to 'true', a bucket will be created to store logs of the state bucket"
    type        = bool
    default     = true
}

variable "s3_log_prefix" {
    description = "Log prefix/path for the log bucket. Note: `s3 logging needs to be enabled`"
    type = string
    default = "log/"
}

variable "dynamodb_table_state_locking_name" {
  description = "name for the Dynamodb table storing the Terraform locking mechanism"
  type        = string
}

variable "dynamodb_enabled_encryption" {
  description = "When set to true, Dynamodb table encryption is enabled"
  type        = bool
  default     = true
}

variable "dynamodb_point_intime_recovery_enabled" {
  description = "When set to true, Dynamodb table PIT recovery is enabled"
  type        = bool
  default     = true
}
