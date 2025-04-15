# Create DB Subnet with private db subnet created with VPC
resource "aws_db_subnet_group" "rds" {
  name        = "dbsubnets-${var.vpc_name}"
  description = "The subnets used for custella-dev RDS deployments"
  subnet_ids  = var.db_private_subnet_ids

  tags = {
    Name = "dbsubnets-${var.vpc_name}"
  }
}