resource "aws_instance" "myserver" {
  ami           = "ami-0ec10929233384c7f"
  instance_type = var.aws_instance_type
  key_name      = "tfwalkthroug-01"
  # vpc_security_group_ids      = [aws_security_group.nginx_sg.id]
  # user_data                   = file("${path.module}/userdata.sh")
  # subnet_id                   = aws_subnet.tf_public_subnet.id
  associate_public_ip_address = true
  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_config.root_volume_size
    volume_type           = var.ec2_config.root_volume_type
  }

  tags = merge(var.additional_tags,
    {
      Name  = "sample-server"
      Owner = local.owner
  })
}
