output "admin_group_name" {
  description = "The ARN of the admin group"
  value       = aws_iam_group.admins.name
}