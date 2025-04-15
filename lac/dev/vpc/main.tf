# VPC
resource "aws_vpc" "custella_vpc" {
  cidr_block = "10.${var.cidr_numeral}.0.0/16" # Please set this according to your company size
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name                                        = "vpc-${var.vpc_name}",
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "custella-igw" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name = "igw-${var.vpc_name}"
  }
}

# VPC Default Route Table
resource "aws_default_route_table" "public_rt" {
  default_route_table_id = aws_vpc.custella_vpc.default_route_table_id

  tags = {
    Name = "default-rt-${var.vpc_name}"
  }
}