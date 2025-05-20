output "aws_vpc" {
    value = aws_vpc.lab-vpc.id
}
output "dev_public_ec2_subnet-02_output-01" {
    description = "Outputs the ID of the selected public EC2 subnet"
    value = "${aws_subnet.dev_public_ec2_subnet-02[0]}"
  
}
output "dev_public_ec2_subnet-02_output-02" {
    description = "Outputs the ID of the selected public EC2 subnet"
    value = "${aws_subnet.dev_public_ec2_subnet-02[1]}"
  
}
output "dev_public_ec2_subnet-02_output-03" {
    description = "Outputs the ID of the selected public EC2 subnet"
    value = "${aws_subnet.dev_public_ec2_subnet-02[1]}"
  
}

