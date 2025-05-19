module "network" {
  source                   = "./modules/network"
  dev_cidr_block           = var.dev_cidr_block
  dev_tags                 = var.dev_tags
  dev_vpc_name             = var.dev_vpc_name
  private_subnet_cidrs     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnet_cidrs      = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  private_subnet_amq_cidrs = ["10.0.40.0/24", "10.0.50.0/24", "10.0.60.0/24"]
  private_subnet_rmq_cidrs = ["10.0.70.0/24", "10.0.80.0/24", "10.0.90.0/24"]
  env                      = var.env
}