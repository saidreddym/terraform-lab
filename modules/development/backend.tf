terraform {
  backend "s3" {
    bucket = "devtfstbktterraform"
    key    = "devtfstbktterraform.tfstate"
    region = "us-east-1"
  }
}
