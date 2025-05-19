resource "aws_subnet" "public-subnet" {
    count = length(var.public_cidr_block)
    vpc_id = aws_vpc.default.id
    cidr_block = element(var.public_cidr_block, count.index)
    availability_zone = element(var.azs, count.index)

    tags = {
      Name = "${var.vpc_name}-public-subnet-${count.index}"
      Owner = "local.Owner"
    costcenter = "local.costcenter"
    TeamDL =  "local.TeamDL"
    environment = "${var.environment}"
    }
  
}