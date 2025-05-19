variable "vpc_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "environment" {
  type = string
}

variable "ingress_value" {
  type = list(string)
}
