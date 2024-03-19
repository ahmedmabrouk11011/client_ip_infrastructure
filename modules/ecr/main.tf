resource "aws_ecr_repository" "private_repo" {
  name                 = "${var.env}-${var.ecr_name}" # Name your repository
  image_tag_mutability = var.enable_image_tag_mutability
  force_delete = var.enable_force_delete

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256" # Use KMS for key management service encryption
  }

  tags = var.tags
} 