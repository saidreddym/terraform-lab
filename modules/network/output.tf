output "aws_vpc" {
    value = aws_vpc.lab-vpc.id
}
output "dev_public_ec2_subnet-02_output" {

    value = aws_subnet.dev_public_ec2_subnet-02[count.index].id
  
}