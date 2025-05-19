resource "aws_instance" "ec2_instances" {
  count         = length("var.instance_count")
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index % length(var.subnet_ids))
  key_name      = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name        = "ec2-instance-${count.index}"
    Environment = "dev"
  }
}
