resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "dev_ec2_key" {
  key_name   = "dev-ec2-key"
  public_key = tls_private_key.ec2_key.public_key_openssh

  tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-key-pair-for-ec2-mq"
    },
    var.dev_tags
  )
}

resource "local_file" "key_pair_local" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "${path.module}/key_pair_local"
  file_permission = "0600"
}



resource "aws_instance" "ec2_public" {
  count 							        = var.public_ec2_count
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  vpc_security_group_ids = [var.ec2_public_security_group]
  associate_public_ip_address = "true"
  vpc_id = var.vpc_id
  key_name               = aws_key_pair.dev_ec2_key.key_name

  tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-ec2-public-jump${count.index + 1}"
    },
    var.dev_tags
  )
}