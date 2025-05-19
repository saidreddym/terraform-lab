terraform {
  backend "s3" {
    bucket = "prodftfstbktterraform"
    key    = "prodtfstbktterraform.tfstate"
    region = "us-east-1"
  }
}
