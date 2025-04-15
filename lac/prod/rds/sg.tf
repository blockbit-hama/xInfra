# Database Security Group
# This security Group needs to be made before creating database
resource "aws_security_group" "dev_postgres" {
  name        = "postgres-${var.vpc_name}"
  description = "custella-dev postgres SG"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["121.135.190.142/32"]
    description = "office ip"
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.20.100.0/24"]
    description = "private-subnet-a"
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.20.110.0/24"]
    description = "private-subnet-a2"
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["14.138.186.35/32"]
    description = "chris"
  }

  tags = {
    Name = "postgres-${var.vpc_name}"
  }
}
