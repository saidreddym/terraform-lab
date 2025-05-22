terraform {
  backend "s3" {
    /*bucket  = "prodtfstbktterraform"*/
    bucket  = "prodtfstbkttf"
    key     = "volpayapp.tfstate"
    region  = "us-east-1"
    encrypt = true
  }


}

