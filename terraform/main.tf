terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "terraform-test-daniel-magevski"
    key = "terraform.tfstate"
    encrypt = true
    region = "us-east-1"
    
  }
}

provider "aws" {
  region = "us-east-1"
}
