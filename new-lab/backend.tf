terraform {
  backend "s3" {
    bucket         = "prodtfstbktterraform"   # Replace with your S3 bucket name
    key            = "prodtfstbktterraform.tfstate"    # Unique path for this environment
    region         = "us-east-1"                     # Replace with your AWS region
    /*dynamodb_table = "terraform-locks"*/               # For state locking
    encrypt        = true
  }
}
