terraform {
  backend "s3" {
    bucket  = "prodtfstbktterraform"
    key     = "volpayapp.tfstate"
    region  = "us-east-1"
    encrypt = true
  }


}

