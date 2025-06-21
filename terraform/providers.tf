terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3"
  
  backend "s3" {
    bucket = "fake-project-us-east-1"
    key = "terraform_modules/terraform.tfstate"
    region = "us-east-1"
  }
  
}

provider "aws" {
  region = var.region
}
