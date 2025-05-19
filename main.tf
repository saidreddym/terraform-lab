module "network" {
    source = "./modules/network"
    dev_cidr_block = var.dev_cidr_block
    dev_tags = var.dev_tags
    
  
}