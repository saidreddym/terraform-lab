output "vpc_id" {
  value = aws_vpc.default.id
}

output "vpc_name" {
    value = var.vpc_name
}

output "environment" {
    value = var.environment
}