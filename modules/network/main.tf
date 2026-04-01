#create a VPC 
resource "aws_vpc" "dev_vpc" {
  cidr_block = var.vpc_cidr #mention the CIDR block 
  tags = {
  Name = "devops-vpc"
}
enable_dns_support   = true
enable_dns_hostnames = true
}

#create subnet for the above VPC 
resource "aws_subnet" "dev_net_1" {
    vpc_id = aws_vpc.dev_vpc.id #mentino the VPC ID
    cidr_block = var.public_subnet_1_cidr # creat the cidr block
    availability_zone = var.az1 #adding the availablity zone
    map_public_ip_on_launch = true
    tags =  {
        Name = "devops-subnet-block"
    }
  
}

resource "aws_subnet" "dev_net_2" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = var.az2
  map_public_ip_on_launch = true
  tags = {
    Name = "devops-subnet-2"
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
resource "aws_route_table_association" "dev_rta_1" {
    subnet_id = aws_subnet.dev_net_1.id
    route_table_id = aws_route_table.dev_rt.id
    
}

#create a route tabel associate
resource "aws_route_table_association" "dev_rta_2" {
    subnet_id = aws_subnet.dev_net_2.id
    route_table_id = aws_route_table.dev_rt.id
    
}