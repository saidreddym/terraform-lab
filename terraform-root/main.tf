
# 1. VPC & Subnet
module "network" {
  source = "./modules/vpc"
  vpc_name = "my-vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  azs = ["us-east-1a", "us-east-1b"]
}

# 2. Security Group
module "security_group" {
  source      = "./modules/sg"
  vpc_id      = module.network.vpc_id
  ingress_ports = [22, 80, 443]
  environment = "dev"
}

# 3. Key Pair
module "keypair" {
  source          = "./modules/keypair"
  key_name        = "my-ec2-key"
  public_key_path = "~/.ssh/id_rsa.pub"
}

# 4. EC2 Compute
module "compute" {
  source                 = "./modules/compute"
  instance_count         = 10
  ami_id                 = "ami-0953476d60561c955"  # hardcoded as required
  instance_type          = "t2.micro"
  subnet_ids             = module.network.public_subnet_ids
  vpc_security_group_ids = [module.security_group.sg_id]
  key_name               = module.keypair.key_name
}
