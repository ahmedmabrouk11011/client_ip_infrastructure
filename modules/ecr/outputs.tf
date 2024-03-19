output "ecr_repository_url" {
  value = aws_ecr_repository.private_repo.repository_url
  description = "The URL of the created ECR repository"
}