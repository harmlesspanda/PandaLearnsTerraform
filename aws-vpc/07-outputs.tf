output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.myserver.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.myserver.public_ip
}

output "instance_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.myserver.public_dns
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.nginx_sg.id
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.tf_vpc.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.tf_public_subnet.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.tf_private_subnet.id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.tf_igw.id
}

output "route_table_id" {
  description = "Route Table ID"
  value       = aws_route_table.tf_rt.id
}

output "web_access" {
  description = "Web + SSH access info"
  value = {
    url = "http://${aws_instance.myserver.public_ip}"
    ssh = "ssh -i tfwalkthroug-01.pem ubuntu@${aws_instance.myserver.public_ip}"
  }
}
