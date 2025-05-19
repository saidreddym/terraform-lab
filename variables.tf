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