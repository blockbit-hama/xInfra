output "vpc_id" {
  description = "VPC ID of newly created VPC"
  value       = aws_vpc.custella_vpc.id
}

# Private subnets
output "private_subnet_a_id" {
  description = "private subnet ID in VPC"
  value       = aws_subnet.private_subnet_a.id
}

output "private_subnet_a2_id" {
  description = "private subnet ID in VPC"
  value       = aws_subnet.private_subnet_a2.id
}

output "private_subnet_b_id" {
  description = "private subnet ID in VPC"
  value       = aws_subnet.private_subnet_b.id
}

output "private_subnet_c_id" {
  description = "private subnet ID in VPC"
  value       = aws_subnet.private_subnet_c.id
}

output "private_subnet_d_id" {
  description = "private subnet ID in VPC"
  value       = aws_subnet.private_subnet_d.id
}

# Public subnets
output "public_subnet_a_id" {
  description = "public subnet ID in VPC"
  value       = aws_subnet.public_subnet_a.id
}

output "public_lb_subnet_a_id" {
  description = "public LB subnet ID in VPC"
  value       = aws_subnet.public_lb_subnet_a.id
}

output "public_subnet_c_id" {
  description = "public subnet ID in VPC"
  value       = aws_subnet.public_subnet_c.id
}

output "public_lb_subnet_c_id" {
  description = "public LB subnet ID in VPC"
  value       = aws_subnet.public_lb_subnet_c.id
}

# DB Private subnets
output "db_private_subnet_ids" {
  description = "private subnet ID in VPC"
  value       = [
    aws_subnet.private_db_subnet_a.id,
    aws_subnet.private_db_subnet_c.id
  ]
}
