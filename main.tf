terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "dev_vpc" {
  cidr_block = var.var_terra.vpc_cidr
  tags = {
  Name = "devops-vpc"
}

}