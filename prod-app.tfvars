Prod_cidr_block = "172.0.0.0/18"

Prod_tags = {
  Customer      = "amb"
  Department    = "Prod support"
  Stream        = "Corporate Onboarding"
  Environment   = "Prod"
  "Customer Type" = "Bank"
  Ticket        = "0lxs"
}

Prod_vpc_name = "Prod-vpc"

env = "Prod"

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
    cidr_ipv4 = "172.0.3.0/24"
  }
]

private_ec2_ingress_rules = [
  {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    cidr_ipv4 = "172.0.0.0/16"
  }
]

volume_data_size = 10

volume_root_size = 10

private_subnet_cidrs = ["172.0.1.0/24", "172.0.2.0/24", "172.0.3.0/24"]

public_subnet_cidrs = ["172.0.172.0/24", "172.0.20.0/24", "172.0.30.0/24"]

private_subnet_amq_cidrs = ["172.0.40.0/24", "172.0.50.0/24", "172.0.60.0/24"]

private_subnet_rmq_cidrs = ["172.0.70.0/24", "172.0.80.0/24", "172.0.90.0/24"]

private_subnet_db_cidrs = ["172.0.4.0/24", "172.0.5.0/24", "172.0.6.0/24"]
