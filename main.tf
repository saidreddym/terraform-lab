module "network" {
  source                   = "./modules/network"
  dev_cidr_block           = var.dev_cidr_block
  dev_tags                 = var.dev_tags
  dev_vpc_name             = var.dev_vpc_name
  private_subnet_cidrs     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnet_cidrs      = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  private_subnet_amq_cidrs = ["10.0.40.0/24", "10.0.50.0/24", "10.0.60.0/24"]
  private_subnet_rmq_cidrs = ["10.0.70.0/24", "10.0.80.0/24", "10.0.90.0/24"]
  private_subnet_db_cidrs  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  azs                      = var.azs
  env                      = var.env
  public_ec2_ingress_rules = var.public_ec2_ingress_rules
  
  }
module "s3" {
  source       = "./modules/s3"
  env          = var.env
  dev_tags     = var.dev_tags
  dev_vpc_name = var.dev_vpc_name
}
module "ec2_mq_compute" {
  source            = "./modules/compute"
  env               = var.env
  dev_tags          = var.dev_tags
  dev_vpc_name      = var.dev_vpc_name
  ec2_instance_type = var.ec2_instance_type
  ec2_ami           = var.ec2_ami
  ec2_subnet_id     = module.network.dev_public_ec2_subnet-02_output-01
  public_ec2_count = var.public_ec2_count
  ec2_public_security_group = module.network.dev_ec2_pub_sg_01
  
}




