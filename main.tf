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

#creat internet gateway
resource "aws_internet_gateway" "dev_igw" {
    vpc_id = aws_vpc.dev_vpc.id 
    tags = {
      name = "devops-IGW"
    }
  
}

#create routing table
resource "aws_route_table" "dev_rt" {
  vpc_id = aws_vpc.dev_vpc.id 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }
  tags = {
    name = "devops-route-table"
  }
}

#create a route tabel associate
resource "aws_route_table_association" "dev_rta" {
    subnet_id = aws_subnet.dev_net.id
    route_table_id = aws_route_table.dev_rt.id
    
}