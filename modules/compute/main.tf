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
  vpc_security_group_ids = var.ec2_public_security_group
  associate_public_ip_address = "true"
 subnet_id = var.ec2_subnet_id
 
  root_block_device {
    volume_size = var.volume_root_size               # Size in GB
    volume_type = "gp2"            # General Purpose SSD
    delete_on_termination = true   # Deletes volume when instance is terminated
    encrypted = true
  }

ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = var.volume_data_size
    volume_type = "gp2"
    delete_on_termination = true
    encrypted = true
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>Hello from Terraform EC2</h1>" > /var/www/html/index.html
              EOF
key_name               = aws_key_pair.dev_ec2_key.key_name

  tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-ec2-public-jump${count.index + 1}"
    },
    var.dev_tags
  )
}


resource "aws_instance" "ec2_private" {
  count 							        = var.private_ec2_count
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  vpc_security_group_ids = var.ec2_private_security_group
  associate_public_ip_address = "false"
 subnet_id = var.ec2_private_subnet_id
 # Root volume (usually /dev/xvda)
  root_block_device {
    volume_size = var.volume_root_size               # Size in GB
    volume_type = "gp2"            # General Purpose SSD
    delete_on_termination = true   # Deletes volume when instance is terminated
    encrypted = true
  }

  # Additional EBS volume (e.g. /dev/sdf)
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = var.volume_data_size
    volume_type = "gp2"
    delete_on_termination = true
    encrypted = true
  }
  
key_name               = aws_key_pair.dev_ec2_key.key_name

  tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-ec2-pvt-${count.index + 1}"
    },
    var.dev_tags
  )
}