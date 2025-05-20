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