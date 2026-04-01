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

 

resource "aws_eks_cluster" "dev_eks" {
    name = "devop-eks-cluster"
    version = "1.29"
    role_arn = "arn:aws:iam::210447603690:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS"
    vpc_config {
      subnet_ids = data.terraform_remote_state.network.outputs.subnet_ids
    }
  tags = {
    name = "devops-eks"
  }
}  

resource "aws_eks_node_group" "dev_eks_node" {
      cluster_name    = aws_eks_cluster.dev_eks.name
      node_group_name = "devops-eks-node"
      node_role_arn   = "arn:aws:iam::210447603690:role/aws-service-role/eks-nodegroup.amazonaws.com/AWSServiceRoleForAmazonEKSNodegroup"
      subnet_ids = data.terraform_remote_state.network.outputs.subnet_ids

      scaling_config {
        min_size = 1
        max_size = 2
        desired_size = 2
      }

    instance_types = [var.instance_type] 
    tags = {
        name = "devops-eks-node-group"
    }  
  
}


variable "instance_type" {
    type = string
    default = "t2.micro"
  
}