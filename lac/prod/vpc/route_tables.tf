# Route Table for public subnets
resource "aws_route_table" "public_rt_a" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name = "020-000.public-a-rt-${var.vpc_name}"
  }
}

resource "aws_route_table" "public_lb_rt_a" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name = "020-010.public-lb-a-rt-${var.vpc_name}"
  }
}

resource "aws_route_table" "public_rt_c" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name = "020-002.public-c-rt-${var.vpc_name}"
  }
}

resource "aws_route_table" "public_lb_rt_c" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name = "020-012.public-lb-c-rt-${var.vpc_name}"
  }
}

# Route Table Association for public subnets
resource "aws_route_table_association" "public_rt_a_association" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_rt_a.id
}

resource "aws_route_table_association" "public_lb_rt_a_association" {
  subnet_id      = aws_subnet.public_lb_subnet_a.id
  route_table_id = aws_route_table.public_lb_rt_a.id
}

resource "aws_route_table_association" "public_rt_c_association" {
  subnet_id      = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.public_rt_c.id
}

resource "aws_route_table_association" "public_lb_rt_c_association" {
  subnet_id      = aws_subnet.public_lb_subnet_c.id
  route_table_id = aws_route_table.public_lb_rt_c.id
}


# Route Table for private subnets
resource "aws_route_table" "private_rt_a" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name    = "020-100.private-a-rt-${var.vpc_name}"
    Network = "Private"
  }
}

resource "aws_route_table" "private_rt_a2" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name    = "020-110.private-a2-rt-${var.vpc_name}"
    Network = "Private"
  }
}

resource "aws_route_table" "private_rt_b" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name    = "020-101.private-b-rt-${var.vpc_name}"
    Network = "Private"
  }
}

resource "aws_route_table" "private_rt_c" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name    = "020-102.private-c-rt-${var.vpc_name}"
    Network = "Private"
  }
}

resource "aws_route_table" "private_rt_d" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name    = "020-103.private-d-rt-${var.vpc_name}"
    Network = "Private"
  }
}

# Route Table Association for private subnets
resource "aws_route_table_association" "private_rt_a_association" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_rt_a.id
}

resource "aws_route_table_association" "private_rt_a2_association" {
  subnet_id      = aws_subnet.private_subnet_a2.id
  route_table_id = aws_route_table.private_rt_a2.id
}

resource "aws_route_table_association" "private_rt_b_association" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_rt_b.id
}

resource "aws_route_table_association" "private_rt_c_association" {
  subnet_id      = aws_subnet.private_subnet_c.id
  route_table_id = aws_route_table.private_rt_c.id
}

resource "aws_route_table_association" "private_rt_d_association" {
  subnet_id      = aws_subnet.private_subnet_d.id
  route_table_id = aws_route_table.private_rt_d.id
}

# Route Table for DB private subnets
resource "aws_route_table" "private_db_rt_a" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name    = "020-200.private-a-db-rt-${var.vpc_name}"
    Network = "Private"
  }
}

resource "aws_route_table" "private_db_rt_b" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name    = "020-201.private-b-db-rt-${var.vpc_name}"
    Network = "Private"
  }
}

resource "aws_route_table" "private_db_rt_c" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name    = "020-202.private-c-db-rt-${var.vpc_name}"
    Network = "Private"
  }
}

resource "aws_route_table" "private_db_rt_d" {
  vpc_id = aws_vpc.custella_vpc.id

  tags = {
    Name    = "020-203.private-d-db-rt-${var.vpc_name}"
    Network = "Private"
  }
}

# Route Table Association for DB private subnets
resource "aws_route_table_association" "private_db_rt_a_association" {
  subnet_id      = aws_subnet.private_db_subnet_a.id
  route_table_id = aws_route_table.private_db_rt_a.id
}

resource "aws_route_table_association" "private_db_rt_b_association" {
  subnet_id      = aws_subnet.private_db_subnet_b.id
  route_table_id = aws_route_table.private_db_rt_b.id
}

resource "aws_route_table_association" "private_db_rt_c_association" {
  subnet_id      = aws_subnet.private_db_subnet_c.id
  route_table_id = aws_route_table.private_db_rt_c.id
}

resource "aws_route_table_association" "private_db_rt_d_association" {
  subnet_id      = aws_subnet.private_db_subnet_d.id
  route_table_id = aws_route_table.private_db_rt_d.id
}