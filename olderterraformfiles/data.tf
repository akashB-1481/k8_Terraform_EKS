data "aws_ami" "eks_default" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amazon-eks-node-*"]
  }

  owners = ["602401143452"] # AWS EKS AMI account
}