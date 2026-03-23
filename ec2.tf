# Security Group
resource "aws_security_group" "rancher_sg" {
  name        = "rancher-sg"
  description = "Allow SSH and Rancher"
  vpc_id      = aws_vpc.dev_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "rancher_ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.rancher_ec2.instance_type
  subnet_id                   = aws_subnet.dev_net_1.id
  vpc_security_group_ids      = [aws_security_group.rancher_sg.id]
  key_name                    = [aws_key_pair.devops]
  associate_public_ip_address = true

  tags = {
    Name = "rancher-server"
  }
} 

resource "aws_key_pair" "devops" {
  key_name   = "devops-key"
  public_key = file("/home/devopsadmin/.ssh/id_rsa_rancher.pub")
}