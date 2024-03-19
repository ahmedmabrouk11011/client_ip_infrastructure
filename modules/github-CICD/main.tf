resource "aws_iam_user" "cicd_user" {
  name = "${var.env}-CICD-USER"
}

resource "aws_iam_access_key" "cicd_user_key" {
  user = aws_iam_user.cicd_user.name
}

resource "aws_iam_user_policy" "cicd_user_policy" {
  name = "cicd-user-policy"
  user = aws_iam_user.cicd_user.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_secretsmanager_secret" "cicd_user_keys_secret" {
  name = "${var.env}/cicd_user_keys"
}

resource "aws_secretsmanager_secret_version" "ecr_user_keys_secret_version" {
  secret_id     = aws_secretsmanager_secret.cicd_user_keys_secret.id
  secret_string = jsonencode({
    access_key = aws_iam_access_key.cicd_user_key.id,
    secret_key = aws_iam_access_key.cicd_user_key.secret
  })
}
