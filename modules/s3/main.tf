resource "aws_s3_bucket" "dev-s3-bucket" {
  
  bucket   = "dev-lab-test-temp-bucket"
  force_destroy = "true"
  tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-ngw-for-ec2-mq-db-01"
    },
    var.dev_tags
  )
}

resource "aws_s3_bucket_acl" "dev-s3-acl" {
  bucket = aws_s3_bucket.dev-s3-bucket.id
  acl    = "private"
}
