data "aws_ami" "eks_default" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amazon-eks-node-*x86_64*"]
  }

  owners = ["602401143452"]
}