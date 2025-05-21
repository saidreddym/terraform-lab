dev_cidr_block = "10.0.0.0/16"

dev_tags = {
  Customer      = "xyz"
  Department    = "Dev support"
  Stream        = "Corporate Onboarding"
  Environment   = "Dev"
  "Customer Type" = "PAAS"
  Ticket        = "08765"
}

dev_vpc_name = "dev-vpc"
key_pair_name = "dev-key-pair"

env = "dev"

azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

ec2_ami = "ami-0953476d60561c955"

ec2_instance_type = "t2.micro"

public_ec2_count = 1

private_ec2_count = 1

public_ec2_ingress_rules = [
  {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
  },
  {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_ipv4 = "10.0.3.0/24"
  }
]

private_ec2_ingress_rules = [
  {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    cidr_ipv4 = "10.0.0.0/16"
  }
]

volume_data_size = 25

volume_root_size = 25

private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

public_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]

private_subnet_amq_cidrs = ["10.0.40.0/24", "10.0.50.0/24", "10.0.60.0/24"]

private_subnet_rmq_cidrs = ["10.0.70.0/24", "10.0.80.0/24", "10.0.90.0/24"]

private_subnet_db_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
