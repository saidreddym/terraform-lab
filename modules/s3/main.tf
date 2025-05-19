resource "aws_s3_bucket" "dev-s3-bucket" {
  
  bucket   = "dev-lab-test-temp-bucket"
  tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-ngw-for-ec2-mq-db-01"
    },
    var.dev_tags
  )
}
