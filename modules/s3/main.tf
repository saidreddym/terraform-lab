resource "aws_s3_bucket" "dev-s3-bucket" {
  
  bucket   = "dev-lab-test-temp-bucket"
  force_destroy = "false"
  tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-ngw-for-ec2-mq-db-01"
    },
    var.dev_tags
  )
}

resource "aws_s3_bucket_public_access_block" "dev-s3-bucket-public-access" {
  bucket = aws_s3_bucket.dev-s3-bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
