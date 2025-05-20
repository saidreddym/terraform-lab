output "aws_vpc" {
    value = aws_vpc.lab-vpc.id
}
output "dev_public_ec2_subnet-02_output" {
    description = "Outputs the ID of the selected public EC2 subnet"
    value = aws_subnet.dev_public_ec2_subnet-02[var.subnet_index].id
  
}