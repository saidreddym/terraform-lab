terraform {
  backend "s3" {
    bucket = "proftfstbktterraform"
    key    = "prodtfstbktterraform.tfstate"
    region = "us-east-1"
  }
}
