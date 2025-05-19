resource "aws_vpc" "lab-vpc" {
  cidr_block = var.cidr_block

  tags = var.tags
  
}