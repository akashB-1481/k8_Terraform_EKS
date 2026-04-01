terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

#adding profile to mentione the iam i want to use
provider "aws" {
  region = "ap-south-1"
  profile = "devops"
}

module "network" {
    source = "../modules/network"
    
}