output "ec2 public ip" {
  value = aws_instance.rancher_ec2.public_ip
}