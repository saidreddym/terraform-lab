module "name" {
source = "../modules/vpc"
tags = var.tags
cidr_block = var.cidr_block
  
}