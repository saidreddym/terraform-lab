terraform {
  backend "s3" {
    bucket = "prodtfstbktterraform"
    key    = "prodtfstbktterraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
