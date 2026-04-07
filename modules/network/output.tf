output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.dev_vpc.id
}

output "subnet_ids" {
  description = "List of public subnet IDs"
  value = aws_subnet.dev_net[*].id
}

output "subnet_1_id" {
  description = "Subnet 1 ID"
  value       = aws_subnet.dev_net_1.id
}

output "subnet_2_id" {
  description = "Subnet 2 ID"
  value       = aws_subnet.dev_net_2.id
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.dev_igw.id
}

output "route_table_id" {
  description = "Route Table ID"
  value       = aws_route_table.dev_rt.id
}