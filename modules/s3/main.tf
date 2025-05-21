resource "random_pet" "bucket_suffix" {
  length    = 1
  separator = "-"
}

resource "aws_s3_bucket" "dev-s3-bucket" {
  bucket = "${lower(var.env)}-bkt-volpay-app-${lower(random_pet.bucket_suffix.id)}"


  force_destroy = "false"
  acl    = "private"
  tags = merge(
    {
      Name = "${var.dev_vpc_name}-${var.env}-ngw-for-ec2-mq-db-01"
    },
    var.dev_tags
  )
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.dev-s3-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "s3-bucket-sse" {
  bucket = aws_s3_bucket.dev-s3-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_public_access_block" "dev-s3-bucket-public-access" {
  bucket = aws_s3_bucket.dev-s3-bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
