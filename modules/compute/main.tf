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
  filename = "key_pair_local"
}