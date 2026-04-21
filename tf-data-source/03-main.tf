data "aws_ami" "ami_name" {
  most_recent = true
  owners      = ["amazon"]
  provider    = aws.east

  filter {
    name = "name"
    # This specifically picks the official Amazon Linux 2023 AMI
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] # Matches t2.micro and t3.micro Free Tier instances
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_security_group" "name_security_group" {
  tags = {
    Name = "nginx-sg"
  }
}

data "aws_subnet" "subnet_name" {
  tags = {
    Name = "tf_public_subnet"
    name = "tf_public_subnet"
  }
}

data "aws_vpc" "my_vpc" {
  tags = {
    Name = "tf_vpc"
  }
}

data "aws_availability_zones" "names" {
  state = "available"
}

data "aws_caller_identity" "acct_name" {
}

data "aws_region" "name" {

}
