locals {
  common_tags = {
    Name        = var.vpc_name
    Owner       = var.owner
    costcenter  = var.costcenter
    TeamDL      = var.TeamDL
    environment = var.environment
  }
}