# routes for internet gateway which will be set in public subnet
resource "aws_route" "public_route_a" {
  route_table_id         = aws_route_table.public_rt_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.custella-igw.id
}

resource "aws_route" "public_lb_route_a" {
  route_table_id         = aws_route_table.public_lb_rt_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.custella-igw.id
}

resource "aws_route" "public_route_c" {
  route_table_id         = aws_route_table.public_rt_c.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.custella-igw.id
}

resource "aws_route" "public_lb_route_c" {
  route_table_id         = aws_route_table.public_lb_rt_c.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.custella-igw.id
}

resource "aws_route" "public_db_route_a" {
  route_table_id         = aws_route_table.private_db_rt_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.custella-igw.id
}

# routes for NAT gateway which will be set in private subnet
resource "aws_route" "private_route_a" {
  route_table_id         = aws_route_table.private_rt_a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-a.id
}

resource "aws_route" "private_route_a2" {
  route_table_id         = aws_route_table.private_rt_a2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-a.id
}

resource "aws_route" "private_route_c" {
  route_table_id         = aws_route_table.private_rt_c.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-a.id # nat a
}