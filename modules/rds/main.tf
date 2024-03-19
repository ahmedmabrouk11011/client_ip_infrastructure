# Randomly generated password to use in secrets.
resource "random_password" "password" {
  # config
  length  = 16
  upper   = true
  numeric = true
  special = false
}


resource "aws_secretsmanager_secret" "rds_credentials" {
  name = "${var.env}/${var.name}/rds-credentials"
  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id     = aws_secretsmanager_secret.rds_credentials.id
  secret_string = jsonencode({
    DB_USERNAME = var.username
    DB_PASSWORD = random_password.password.result
    DB_HOST = aws_db_instance.default.endpoint
    DB_PORT = aws_db_instance.default.port
    DB_NAME = var.db_name
  })
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.env}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(
    var.tags,
    { Name = "${var.env} Subnet Group" },
  )
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.env}-rds-security-group"
  description = "Security group for ${var.env} RDS instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    security_groups = var.security_group_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    { Name = "${var.env} ${var.name} RDS Security Group" },
  )
}

resource "aws_db_parameter_group" "db_parameter_group" {
  name   = "${var.env}-${var.name}-parameter-group"
  family = var.parameter_group_family

  parameter {
    name  = "rds.force_ssl"
    value = "0"
  }

  tags = var.tags
}

resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  identifier           = "${var.name}-${var.env}"
  username             = var.username
  password             = random_password.password.result
  parameter_group_name = aws_db_parameter_group.db_parameter_group.name
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  skip_final_snapshot = true
  apply_immediately = true

  tags = var.tags
}