variable "dev_cidr_block" {
  default = "10.0.0.0/16"
}

#Approved-Tags
variable "dev_tags" {
  type = map(any)
  default = {
    "Customer"      = "xyz"
    "Department"    = "Dev support"
    "Stream"        = "Corporate Onboarding"
    "Environment"   = "Dev"
    "Customer Type" = "PAAS"
    "Ticket"        = "08765"
  }
}

variable "dev_vpc_name" {
  default = "dev-vpc"
}
variable "env" {
  default = "dev"
}
variable "azs" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]

}
variable "ec2_ami" {
  default = "ami-0953476d60561c955"
}
variable "ec2_instance_type" {
  default = "t2.micro"
}
variable "public_ec2_count" {
  default = 1

}

variable "public_ec2_ingress_rules" {
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr_ipv4 = string
  }))
  default = [
    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_ipv4 = "0.0.0.0/0" # placeholder; override as needed
    },
    {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
      cidr_ipv4 = "10.0.1.0/24"
    },
    {
      from_port = 8080
      to_port   = 8080
      protocol  = "tcp"
      cidr_ipv4 = "10.0.2.0/24"
    },
    {
      from_port = 8085
      to_port   = 8085
      protocol  = "tcp"
      cidr_ipv4 = "10.0.3.0/24"
    }
  ]
}
variable "ec2_public_security_group" {
  description = "List of security group IDs"
  type        = list(string)
}

