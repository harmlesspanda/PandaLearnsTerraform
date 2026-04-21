
resource "aws_instance" "myserver" {
  ami             = "ami-0ec10929233384c7f"
  instance_type   = "t3.micro"
  key_name        = "tfwalkthroug-01"
  subnet_id       = data.aws_subnet.subnet_name.id
  security_groups = [data.aws_security_group.name_security_group.id]


  user_data                   = file("${path.module}/userdata.sh")
  associate_public_ip_address = true

  tags = {
    Name = "sample-server"
  }
}
