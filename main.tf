module "network" {
  source                    = "./modules/network"
  dev_cidr_block            = var.dev_cidr_block
  dev_tags                  = var.dev_tags
  dev_vpc_name              = var.dev_vpc_name
  private_subnet_cidrs      = var.private_subnet_cidrs
  public_subnet_cidrs       = var.public_subnet_cidrs
  private_subnet_amq_cidrs  = var.private_subnet_amq_cidrs
  private_subnet_rmq_cidrs  = var.private_subnet_rmq_cidrs 
  private_subnet_db_cidrs   = var.private_subnet_db_cidrs
  public_ec2_ingress_rules  = var.public_ec2_ingress_rules
  private_ec2_ingress_rules = var.private_ec2_ingress_rules
  azs                       = var.azs
  env                       = var.env
  
}
module "s3" {
  source       = "./modules/s3"
  env          = var.env
  dev_tags     = var.dev_tags
  dev_vpc_name = var.dev_vpc_name
}
module "ec2_mq_compute" {
  source                     = "./modules/compute"
  env                        = var.env
  dev_tags                   = var.dev_tags
  dev_vpc_name               = var.dev_vpc_name
  ec2_instance_type          = var.ec2_instance_type
  ec2_ami                    = var.ec2_ami
  public_ec2_count           = var.public_ec2_count
  ec2_subnet_id              = module.network.dev_public_ec2_subnet-02_output_01.id
  ec2_public_security_group  = [module.network.dev_ec2_pub_sg_01]
  private_ec2_count          = var.private_ec2_count
  ec2_private_security_group = [module.network.ec2_private_sg_01]
  ec2_private_subnet_id      = module.network.dev_private_ec2_subnet-01.id
  volume_data_size = var.volume_data_size
  volume_root_size = var.volume_root_size
  }




