terraform {
  backend "s3" {
    bucket = "prodtfstbktterraform"
    key    = "preprod/volpayapp.tfstate"
    region = "us-east-1"
    encrypt = true
  }
  
    
  }

