resource "aws_subnet" "private-subnet" {
    count = length(var.private_cidr_block)
    vpc_id = aws_vpc.default.id
    cidr_block = element(var.private_cidr_block, count.index)
    availability_zone = element(var.azs, count.index)

    tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-private-subnet"
    }
     )
  
}

resource "aws_subnet" "public-subnet" {
    count = length(var.public_cidr_block)
    vpc_id = aws_vpc.default.id
    cidr_block = element(var.public_cidr_block, count.index)
    availability_zone = element(var.azs, count.index)

    tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-public-subnet"
    }
     )
  
}