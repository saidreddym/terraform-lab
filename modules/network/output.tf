output "aws_vpc" {
    value = aws_vpc.lab-vpc.id
}
output "dev_public_ec2_subnet-02_output_01" {
    
    value = "${aws_subnet.dev_public_ec2_subnet-02[0]}"
}
output "dev_public_ec2_subnet-02_output_02" {
    
    value = "${aws_subnet.dev_public_ec2_subnet-02[1]}"
}
output "dev_public_ec2_subnet-02_output_03" {
    
    value = "${aws_subnet.dev_public_ec2_subnet-02[2]}"
}
output "dev_ec2_pub_sg_01" {
    value = aws_security_group.ec2_public_sg_01.id
}
output "vpc" {
    value = aws_vpc.lab-vpc.id
}
output "dev_private_ec2_subnet-01" {
    value = "${aws_subnet.dev_private_ec2_subnet-01[0]}"
  
}
output "dev_private_ec2_subnet-02" {
    value = "${aws_subnet.dev_private_ec2_subnet-01[1]}"
  
}
output "dev_private_ec2_subnet-03" {
    value = "${aws_subnet.dev_private_ec2_subnet-01[2]}"
  
}