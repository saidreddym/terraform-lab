resource "aws_vpc" "lab-vpc" {
  cidr_block = var.dev_cidr_block
  
  instance_tenancy = "default"
  
  tags = merge(
    {
      "Name" = var.dev_vpc_name
    },
  var.dev_tags)
}
#################################################
###################EC2 Subnets###################

resource "aws_subnet" "dev_private_ec2_subnet-01" {
  count = length(var.private_subnet_cidrs )
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = element(var.private_subnet_cidrs, count.index)

  tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-rt${count.index + 1}"
    },
  var.dev_tags)
}

resource "aws_subnet" "dev_public_ec2_subnet-02" {
  count = length(var.public_subnet_cidrs )
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = element(var.public_subnet_cidrs, count.index)

  tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-public-rt${count.index + 1}"
    },
  var.dev_tags)
}

#################################################
###################RMQ & AMQ Subnets#############


resource "aws_subnet" "dev_private_amq_subnet-03" {
  count = length(var.private_subnet_amq_cidrs)
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = element(var.private_subnet_amq_cidrs, count.index)

  tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-amq-rt${count.index + 1}"
    },
  var.dev_tags)
}

resource "aws_subnet" "dev_private_rmq_subnet-04" {
  count = length(var.private_subnet_rmq_cidrs)
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = element(var.private_subnet_rmq_cidrs, count.index)

  tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-rmq-rt${count.index + 1}"
    },
  var.dev_tags)
}
#################################################
###################IGW GW########################
resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-igw"
    },
  var.dev_tags)
}

############################################################
###################EC2 - RT (Public & Private) #############
resource "aws_route_table" "dev-ec2-public-rt-01" {
  vpc_id = aws_vpc.lab-vpc.id
  count = length(var.public_subnet_cidrs)

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }

 tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-public-ec2-rt${count.index + 1}"
    },
  var.dev_tags)
}
#####################################################################################
resource "aws_route_table" "dev-ec2-private-rt-02" {
  count = length(var.private_subnet_cidrs )
  vpc_id = aws_vpc.lab-vpc.id
 

  /*route {
      cidr_block = element(var.private_subnet_cidrs, count.index)
    gateway_id = aws_internet_gateway.dev-igw.id
  }*/

 tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-ec2-rt${count.index + 1}"
    },
  var.dev_tags)
}
/*##########################################################################################
###################MQ & AMQ - RT (Public & Private) #############


resource "aws_route_table" "dev-private-rt-rmq-03" {
  vpc_id = aws_vpc.lab-vpc.id
  count = length(var.private_subnet_rmq_cidrs)

  route {
    cidr_block = element(var.private_subnet_rmq_cidrs, count.index)
    gateway_id = aws_internet_gateway.dev-igw.id
  }

 tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-rmq-rt${count.index + 1}"
    },
  var.dev_tags)
}

resource "aws_route_table" "dev-private-rt-amq-04" {
  count = length(var.private_subnet_amq_cidrs )
  vpc_id = aws_vpc.lab-vpc.id
 

  route {
      cidr_block = element(var.private_subnet_amq_cidrs, count.index)
    gateway_id = aws_internet_gateway.dev-igw.id
  }

 tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-amq-rt${count.index + 1}"
    },
  var.dev_tags)
}*/
