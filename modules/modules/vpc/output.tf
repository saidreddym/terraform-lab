output "vpc_id" {
  value = aws_vpc.default.id
}

output "vpc_name" {
    value = var.vpc_name
}

output "environment" {
    value = var.environment
}
output "public_subnet" {
    value = aws_subnet.private-subnet.id
  
}

output "private_subnet" {
    value = aws_subnet.private-subnet.id
  
}