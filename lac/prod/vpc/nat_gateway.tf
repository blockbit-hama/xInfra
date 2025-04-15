# NAT Gateway
resource "aws_nat_gateway" "nat-a" {
  connectivity_type = "public"
  allocation_id     = aws_eip.nat-a.id
  subnet_id         = aws_subnet.public_subnet_a.id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "nat-gw-a-${var.vpc_name}"
  }
}

# resource "aws_nat_gateway" "nat-c" {
#   connectivity_type = "public"
#   allocation_id     = aws_eip.nat-c.id
#   subnet_id         = aws_subnet.public_subnet_c.id
#
#   lifecycle {
#     create_before_destroy = true
#   }
#
#   tags = {
#     Name = "nat-gw-c-${var.vpc_name}"
#   }
# }


# Elastic IP for NAT Gateway
resource "aws_eip" "nat-a" {
  #  Indicates if this EIP is for use in VPC
  domain = "vpc"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "eip-nat-a"
  }
}

# resource "aws_eip" "nat-c" {
#   #  Indicates if this EIP is for use in VPC
#   domain = "vpc"
#
#   lifecycle {
#     create_before_destroy = true
#   }
#
#   tags = {
#     Name = "eip-nat-c"
#   }
# }