resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  # tags
  tags = merge(
    var.tags,
    { Name = "${var.env}-main-vpc" },
  )
}