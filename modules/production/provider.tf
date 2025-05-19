terraform {
    backend "s3" {
  bucket         = "prodtfstbktterraform"
  key            = "prodtfstbktterraform.tfstate"
  region         = "us-east-1"
  
}

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
    region = var.aws_region
  # Configuration options
}



