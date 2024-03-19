data "aws_caller_identity" "current" {}

resource "aws_iam_role" "eks_admin_role" {
  name = "${var.eks_name}-admin-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

data "aws_iam_policy_document" "eks_admin_policy" {
  statement {
    actions   = ["eks:*"]
    resources = ["*"]
  }
  statement {
    actions   = ["iam:PassRole"]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "eks_admin_policy" {
  name   = "${var.eks_name}-admin-policy"
  role   = aws_iam_role.eks_admin_role.id
  policy = data.aws_iam_policy_document.eks_admin_policy.json
}

resource "aws_iam_group" "admins" {
  name = "${var.eks_name}-admins"
}

resource "aws_iam_group_policy" "admins_policy" {
  name  = "${var.eks_name}-assume-admins-policy"
  group = aws_iam_group.admins.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "sts:AssumeRole",
        Resource = aws_iam_role.eks_admin_role.arn
      }
    ]
  })
}

locals {
  aws_auth_roles = concat(
    [
      {
        rolearn  = var.nodes_role_arn
        username = "system:node:{{EC2PrivateDNSName}}"
        groups   = ["system:bootstrappers", "system:nodes"]
      },
    ],
    [
      {
        rolearn  = aws_iam_role.eks_admin_role.arn
        username = "admin:{{SessionName}}"
        groups   = ["system:masters"]
      }
    ]
  )
}

resource "kubectl_manifest" "aws_auth" {
  yaml_body = <<YAML
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    app.kubernetes.io/managed-by: Terraform
  name: aws-auth
  namespace: kube-system
data:
  mapAccounts: |
    []
  mapRoles: |
    ${indent(4, yamlencode(local.aws_auth_roles))}
  mapUsers: |
    []
YAML
}
