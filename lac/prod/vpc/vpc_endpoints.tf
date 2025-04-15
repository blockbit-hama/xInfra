# Gateway Type Endpoint ( S3, DynamoDB )
## S3 Endpoint
resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id       = aws_vpc.custella_vpc.id
  service_name = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.public_rt_a.id,
    aws_route_table.public_rt_c.id,
    aws_route_table.private_rt_a.id,
    aws_route_table.private_rt_a2.id,
    aws_route_table.private_rt_b.id,
    aws_route_table.private_rt_c.id,
    aws_route_table.private_rt_d.id
  ]

  tags = {
    Name = "s3-gateway-endpoint"
  }
}

## DynamoDB Endpoint
resource "aws_vpc_endpoint" "dynamodb_endpoint" {
  vpc_id       = aws_vpc.custella_vpc.id
  service_name = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.public_rt_a.id,
    aws_route_table.public_rt_c.id,
    aws_route_table.private_rt_a.id,
    aws_route_table.private_rt_a2.id,
    aws_route_table.private_rt_b.id,
    aws_route_table.private_rt_c.id,
    aws_route_table.private_rt_d.id
  ]

  tags = {
    Name = "dynamodb-gateway-endpoint"
  }
}
