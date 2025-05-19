resource "aws_vpc" "lab-vpc" {
  cidr_block = var.dev_cidr_block
  
  instance_tenancy = "default"
  
  tags = merge(
    {
      "Name" = var.dev_vpc_name
    },
  var.dev_tags)
}