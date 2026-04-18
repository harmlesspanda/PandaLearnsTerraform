resource "aws_instance" "myserver" {
  ami                    = "ami-0ec10929233384c7f"
  instance_type          = "t3.micro"
  key_name               = "tfwalkthroug-01"
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = file("${path.module}/userdata.sh")

  tags = {
    Name = "sample-server"
  }
}

resource "aws_security_group" "web" {
  name = "web-sg"

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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
