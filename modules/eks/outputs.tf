output "eks_name" {
  value = aws_eks_cluster.this.name
}

output "eks_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "openid_provider_arn" {
  value = aws_iam_openid_connect_provider.this[0].arn
}


output "eks_cluster_security_group_id" {
  value = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
  description = "The security group ID of the EKS cluster"
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes.arn
  description = "The EKS Node Role ARN"
}
