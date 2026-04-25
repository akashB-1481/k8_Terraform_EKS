output "ec2_public_ip" {
  value = aws_instance.rancher_ec2.public_ip
}