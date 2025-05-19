module "dev_vpc_1" {
    source = "../modules/vpc"
    vpc_name = "dev-vpc"
    vpc_cidr = "10.0.0.0/16"
    environment = "dev"
    public_cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    private_cidr_block = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
    azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
    costcenter = "costcenter"
    TeamDL = "TeamDL"
    owner = "Owner"
        
}

module "security_group" {
    depends_on = [ module.dev_vpc_1 ]
    source         = "../modules/sg"
    vpc_name       = module.dev_vpc_1.vpc_name
    vpc_id         = module.dev_vpc_1.vpc_id
    ingress_value  = ["80", "8080", "443", "8443", "22", "3306", "1900"]
    environment    = module.dev_vpc_1.environment
    costcenter = "costcenter"
    TeamDL = "TeamDL"
    owner = "Owner"
}

module "compute" {
  source = "../modules/compute"
ami_id = "ami-0953476d60561c955"
instance_type = "t2.micro"
subnet_id = module.dev_vpc_1.private_subnet.id
vpc_security_group_ids = module.security_group.vpc_id
key_name = module.aws_key_pair.key_name

}