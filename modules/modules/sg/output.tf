output "vpc_name" {
    value = var.vpc_name
}
output "vpc_id" {
    value = aws_vpc.default.id
}
output "environment" {
    value = var.environment
}
output "ingress_value" {
    value = var.ingress_value
}