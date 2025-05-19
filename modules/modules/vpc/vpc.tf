resource "aws_vpc" "default" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

 tags = local.common_tags
}

resource "aws_internet_gateway" "default" {
    vpc_id = aws_vpc.default.id
     tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-IGW"
    }
     )
}