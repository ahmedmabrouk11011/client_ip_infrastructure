output "bucket_name" {
  description = "Name of the bucket"
  value       = aws_s3_bucket.s3_terraform_state.*.id
}
output "bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.s3_terraform_state.*.arn
}

output "dynamodb_arn" {
  description = "ARN of the dynamodb table"
  value       = aws_dynamodb_table.table_locking_terraform_state.*.arn
}

output "current_region" {
  description = "Current region"
  value       = data.aws_region.aws_region_current.name
}
output "current_account" {
  description = "Current account"
  value       = data.aws_caller_identity.aws_account_current.account_id
}
