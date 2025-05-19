resource "aws_s3_bucket" "dev-s3-bucket" {
  provider = aws.us_west
  bucket   = "my-bucket-us-east"
}
