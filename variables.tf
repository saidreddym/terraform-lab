variable "dev_cidr_block" {}


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
