
resource "aws_instance" "myserver" {
  ami                         = "ami-0ec10929233384c7f"
  instance_type               = "t3.micro"
  key_name                    = "tfwalkthroug-01"
  vpc_security_group_ids      = [aws_security_group.nginx_sg.id]
  user_data                   = file("${path.module}/userdata.sh")
  subnet_id                   = aws_subnet.tf_public_subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "sample-server"
  }
}
