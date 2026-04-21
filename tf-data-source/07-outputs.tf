output "aws_ami" {
  value       = data.aws_ami.ami_name.id
  description = "AWS Ami"
}

output "security_group_name" {
  value = data.aws_security_group.name_security_group.id
}

output "vpc_name" {
  value = data.aws_vpc.my_vpc.id
}

output "aws_zones" {
  value = data.aws_availability_zones.names
}

output "acct_name" {
  value = data.aws_caller_identity.acct_name
}

output "region_name" {
  value = data.aws_region.name
}

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

