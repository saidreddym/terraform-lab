variable "vpc_name" {}
variable "vpc_cidr" {}
variable "public_subnets" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
