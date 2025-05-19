resource "aws_vpc" "lab-vpc" {
  cidr_block = var.dev_cidr_block
  tags = var.dev_tags
  instance_tenancy = "default"
  
  tags = merge(
    {
      "Name" = var.dev_vpc_name
    },
  var.dr-tags)
}