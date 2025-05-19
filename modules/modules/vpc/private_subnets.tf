resource "aws_subnet" "private-subnet" {
    count = length(var.private_cidr_block)
    vpc_id = aws_vpc.default.id
    cidr_block = element(var.private_cidr_block, count.index)
    availability_zone = element(var.azs, count.index)

    tags = {
      Name = "${var.vpc_name}-private-subnet-${count.index}"
      Owner = var.owner
    costcenter = var.costcenter
    TeamDL =  var.TeamDL
    environment = var.environment
    }
  
}