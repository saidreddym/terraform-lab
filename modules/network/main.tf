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
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false
  /*lifecycle {
    create_before_destroy = true
  }*/


  tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-ec2-sn${count.index + 1}"
    },
  var.dev_tags)
}

resource "aws_subnet" "dev_public_ec2_subnet-02" {
  count = length(var.public_subnet_cidrs )
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = element(var.public_subnet_cidrs, count.index)
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-public-ec2-sn${count.index + 1}"
    },
  var.dev_tags)
}

#################################################
###################RMQ & AMQ & DB Subnets#############


resource "aws_subnet" "dev_private_amq_subnet-03" {
  count = length(var.private_subnet_amq_cidrs)
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = element(var.private_subnet_amq_cidrs, count.index)
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false

  tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-amq-sn${count.index + 1}"
    },
  var.dev_tags)
}

resource "aws_subnet" "dev_private_rmq_subnet-04" {
  count = length(var.private_subnet_rmq_cidrs)
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = element(var.private_subnet_rmq_cidrs, count.index)
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false

  tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-rmq-sn${count.index + 1}"
    },
  var.dev_tags)
}


resource "aws_subnet" "dev_private_mongo_db_subnet_05" {
  count = length(var.private_subnet_db_cidrs)
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = element(var.private_subnet_db_cidrs, count.index)
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false

  tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-mongo-db-sn${count.index + 1}"
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
resource "aws_route_table" "dev-ec2-private-rt-01" {

  vpc_id = aws_vpc.lab-vpc.id
  /*count = length(var.private_subnet_cidrs )*/
  /*route {
      cidr_block = element(var.private_subnet_cidrs, count.index)
    gateway_id = aws_internet_gateway.dev-igw.id
  }*/

 tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-ec2-rt-01"
      /*"Name" = "${var.dev_vpc_name}-${var.env}-private-ec2-rt${count.index + 1}"*/
    },
  var.dev_tags)
}
resource "aws_route_table" "dev-ec2-public-rt-02" {
  vpc_id = aws_vpc.lab-vpc.id
  /*count = length(var.public_subnet_cidrs)*/

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }

 tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-public-ec2-rt-02"
      /*"Name" = "${var.dev_vpc_name}-${var.env}-public-ec2-rt${count.index + 1}"*/
    },
  var.dev_tags)
}


##########################################################################################
###################MQ & AMQ & DB - RT (Public & Private) #############

resource "aws_route_table" "dev-private-rt-amq-03" {
  vpc_id = aws_vpc.lab-vpc.id
  /*count = length(var.private_subnet_amq_cidrs )*/
  /*route {
    cidr_block = element(var.private_subnet_amq_cidrs, count.index)
    gateway_id = aws_internet_gateway.dev-igw.id
  }*/

 tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-amq-rt-03"
      /*"Name" = "${var.dev_vpc_name}-${var.env}-private-amq-rt${count.index + 1}"*/
    },
  var.dev_tags)
}

resource "aws_route_table" "dev-private-rt-rmq-04" {
  vpc_id = aws_vpc.lab-vpc.id
  /*count = length(var.private_subnet_rmq_cidrs)*/

  /*route {
    cidr_block = element(var.private_subnet_rmq_cidrs, count.index)
    gateway_id = aws_internet_gateway.dev-igw.id
  }*/

 tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-rmq-rt-04"
      /*"Name" = "${var.dev_vpc_name}-${var.env}-private-rmq-rt${count.index + 1}"*/
    },
  var.dev_tags)
}


resource "aws_route_table" "dev-private-rt-mongo-db-05" {
  vpc_id = aws_vpc.lab-vpc.id
  /*count = length(var.private_subnet_rmq_cidrs)*/

  /*route {
    cidr_block = element(var.private_subnet_rmq_cidrs, count.index)
    gateway_id = aws_internet_gateway.dev-igw.id
  }*/

 tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-private-mongo-db-rt-05"
      /*"Name" = "${var.dev_vpc_name}-${var.env}-private-rmq-rt${count.index + 1}"*/
    },
  var.dev_tags)
}


##########################################################################################
###################EC2 RT Association #############
resource "aws_route_table_association" "dev-ec2-sn-rt-pub-association" {
  count = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.dev_public_ec2_subnet-02[count.index].id
  route_table_id = aws_route_table.dev-ec2-public-rt-02.id
}

resource "aws_route_table_association" "dev-ec2-sn-rt-pvt-association" {
  count = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.dev_private_ec2_subnet-01[count.index].id
  route_table_id = aws_route_table.dev-ec2-private-rt-01.id
  
}

##########################################################################################
###################RMQ & AMQ & DB RT Association #############
resource "aws_route_table_association" "dev-ec2-sn-rmq-rt-pub-association" {
  count = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.dev_private_rmq_subnet-04[count.index].id
  route_table_id = aws_route_table.dev-private-rt-rmq-04.id
}

resource "aws_route_table_association" "dev-ec2-sn-amq-rt-pvt-association" {
  count = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.dev_private_amq_subnet-03[count.index].id
  route_table_id = aws_route_table.dev-private-rt-amq-03.id
}
resource "aws_route_table_association" "dev-db-sn-mongo-rt-pvt-association" {
  count = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.dev_private_mongo_db_subnet_05[count.index].id
  route_table_id = aws_route_table.dev-private-rt-mongo-db-05.id
}

##########################################################################################
###################EC2 PVT RT- NAT GW #############
resource "aws_eip" "dev_ngw_eip_for_ec2_mq_db" {
  domain = "vpc"
  /*lifecycle {
  prevent_destroy = true
}*/

tags = merge(
    {
      "Name" = "${var.dev_vpc_name}-${var.env}-eip-for-ec2-mq-db"
    },
  var.dev_tags)
}

resource "aws_nat_gateway" "dev_private_ec2_nat_gw_att" {
  count = 1
  allocation_id = aws_eip.dev_ngw_eip_for_ec2_mq_db.id
  subnet_id     = aws_subnet.dev_public_ec2_subnet-02[count.index].id

  tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-ngw-for-ec2-mq-db-01"
    },
    var.dev_tags
  )
}

##########################################################################################
####################SG rule for Public EC2####################

resource "aws_security_group" "ec2_public_sg_01" {
 description = "Allow TLS inbound traffic and all outbound traffic"
 name        = "${var.dev_vpc_name}-${var.env}-sg-for-ec2-pub01"
  vpc_id      = aws_vpc.lab-vpc.id
  dynamic "ingress" {
    for_each = var.public_ec2_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr_ipv4]
    }
  }

   tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-sg-pub"
    },
    var.dev_tags
  )
}
####################SG rule for Private EC2####################

resource "aws_security_group" "ec2_private_sg_01" {
 name        = "${var.dev_vpc_name}-${var.env}-sg-for-ec2-pvt01"
  vpc_id      = aws_vpc.lab-vpc.id
  dynamic "ingress" {
    for_each = var.private_ec2_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = [ingress.value.cidr_ipv4]
    }
  }

   tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-sg-pvt"
    },
    var.dev_tags
  )
}




