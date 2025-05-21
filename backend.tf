terraform {
  backend "s3" {
    bucket = "prodtfstbktterraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
  
    
  }

