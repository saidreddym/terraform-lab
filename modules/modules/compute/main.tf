resource "aws_instance" "ec2-jumpserver" {
  
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "WebServer"
  }
}

resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  key_name   = var.key_name
  public_key = tls_private_key.generated.public_key_openssh

  tags = {
    Name = var.key_name
  }
}

output "private_key_pem" {
  value     = tls_private_key.generated.private_key_pem
  sensitive = true
}
