resource "aws_s3_bucket" "dev-s3-bucket" {
  provider = aws.prod
  bucket   = "my-bucket-us-east"
}
