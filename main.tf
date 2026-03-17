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
  region = var.region
  profile = "devops"
}

#create a VPC 
resource "aws_vpc" "dev_vpc" {
  cidr_block = var.var_terra.vpc_cidr #mention the CIDR block 
  tags = {
  Name = "devops-vpc"
}
enable_dns_support   = true
enable_dns_hostnames = true
}

#create subnet for the above VPC 
resource "aws_subnet" "dev_net" {
    vpc_id = aws_vpc.dev_vpc.id #mentino the VPC ID
    cidr_block = var.var_terra.public_subnet_cidr # creat the cidr block
    availability_zone = var.var_terra.az #adding the availablity zone
    tags =  {
        Name = "devops-subnet-block"
    }
  
}