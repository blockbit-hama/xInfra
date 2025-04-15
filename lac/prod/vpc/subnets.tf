# PUBLIC SUBNET
resource "aws_subnet" "public_subnet_a" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block = "10.${var.cidr_numeral}.${var.cidr_numeral_public_a}.0/24"
  availability_zone = local.zone_a

  # Public IP will be assigned automatically when the instance is launch in the public subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "020-000.public-subnet-a-${var.vpc_name}"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block = "10.${var.cidr_numeral}.${var.cidr_numeral_public_c}.0/24"
  availability_zone = local.zone_c

  # Public IP will be assigned automatically when the instance is launch in the public subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "020-002.public-subnet-c-${var.vpc_name}"
  }
}

resource "aws_subnet" "public_lb_subnet_a" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block = "10.${var.cidr_numeral}.${var.cidr_numeral_public_lb_a}.0/24"
  availability_zone = local.zone_a

  # Public IP will be assigned automatically when the instance is launch in the public subnet
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "020-010.public-lb-subnet-a-${var.vpc_name}",
    "kubernetes.io/role/elb"                    = "1",
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_subnet" "public_lb_subnet_c" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block = "10.${var.cidr_numeral}.${var.cidr_numeral_public_lb_c}.0/24"
  availability_zone = local.zone_c

  # Public IP will be assigned automatically when the instance is launch in the public subnet
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "020-012.public-lb-subnet-c-${var.vpc_name}",
    "kubernetes.io/role/elb"                    = "1",
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

# PRIVATE SUBNETS
resource "aws_subnet" "private_subnet_a" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_private_a}.0/24"
  availability_zone = local.zone_a

  tags = {
    Name    = "020-100.private-subnet-a-${var.vpc_name}"
    Network = "Private"
    "karpenter.sh/discovery" = var.cluster_name
  }
}

resource "aws_subnet" "private_subnet_a2" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_private_a2}.0/24"
  availability_zone = local.zone_a

  tags = {
    Name    = "020-110.private-subnet-a2-${var.vpc_name}"
    Network = "Private"
    "karpenter.sh/discovery" = var.cluster_name
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_private_b}.0/24"
  availability_zone = local.zone_b

  tags = {
    Name    = "020-101.private-subnet-b-${var.vpc_name}"
    Network = "Private"
    "karpenter.sh/discovery" = var.cluster_name
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_private_c}.0/24"
  availability_zone = local.zone_c

  tags = {
    Name    = "020-102.private-subnet-c-${var.vpc_name}"
    Network = "Private"
    "karpenter.sh/discovery" = var.cluster_name
  }
}

resource "aws_subnet" "private_subnet_d" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_private_d}.0/24"
  availability_zone = local.zone_d

  tags = {
    Name    = "020-103.private-subnet-d-${var.vpc_name}"
    Network = "Private"
    "karpenter.sh/discovery" = var.cluster_name
  }
}

# DB PRIVATE SUBNETS
resource "aws_subnet" "private_db_subnet_a" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_db_private_a}.0/24"
  availability_zone = local.zone_a

  tags = {
    Name    = "020-200.private-db-subnet-a-${var.vpc_name}"
    Network = "Private"
  }
}

resource "aws_subnet" "private_db_subnet_b" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_db_private_b}.0/24"
  availability_zone = local.zone_b

  tags = {
    Name    = "020-201.private-db-subnet-b-${var.vpc_name}"
    Network = "Private"
  }
}

resource "aws_subnet" "private_db_subnet_c" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_db_private_c}.0/24"
  availability_zone = local.zone_c

  tags = {
    Name    = "020-202.private-db-subnet-c-${var.vpc_name}"
    Network = "Private"
  }
}

resource "aws_subnet" "private_db_subnet_d" {
  vpc_id = aws_vpc.custella_vpc.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_db_private_d}.0/24"
  availability_zone = local.zone_d

  tags = {
    Name    = "020-203.private-db-subnet-d-${var.vpc_name}"
    Network = "Private"
  }
}