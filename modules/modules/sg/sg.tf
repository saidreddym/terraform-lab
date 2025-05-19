resource "aws_security_group" "allow_all" {
  name        = var.vpc_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_value
    content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   # Use with caution!
    
    }
}
 
  

    tags = {
    Name        = var.vpc_name
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}

