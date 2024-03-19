variable "env" {
  description = "Environment name."
  type        = string
}

variable "tags" {
  description = "Tags for the project"
  type        = map(string)
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
}

variable "storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)"
}

variable "engine" {
  description = "The database engine to use"
}

variable "engine_version" {
  description = "The engine version to use"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
}

variable "name" {
  description = "The name of the database to create when the DB instance is created"
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
}

variable "username" {
  description = "Username for the master DB user"
}

variable "subnet_ids" {
  description = "List of subnet IDs. Must be in at least two different availability zones."
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the security group and RDS instance will be created"
}

variable "cidr_blocks" {
  description = "CIDR blocks that are allowed access to the RDS instance"
  type        = list(string)
  default = []
}

variable "security_group_ids" {
  description = "List of Security Groups that are allowed access to the RDS instance"
  type        = list(string)
  default = []
}

variable "db_port" {
  description = "The Default RDS Instance Port"
}

variable "parameter_group_family" {
  description = "Name of the DB parameter group to associate"
}