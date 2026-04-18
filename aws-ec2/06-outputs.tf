output "instance_ids" {
  value = aws_instance.myserver[*].id
}

output "public_ips" {
  value = aws_instance.myserver[*].public_ip
}

output "public_dns" {
  value = aws_instance.myserver[*].public_dns
}

output "private_ips" {
  value = aws_instance.myserver[*].private_ip
}

output "availability_zones" {
  value = aws_instance.myserver[*].availability_zone
}
