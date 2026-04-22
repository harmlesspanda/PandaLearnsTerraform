aws_instance_type = "t3.micro"
ec2_config = {
  root_volume_size = 30,
  root_volume_type = "gp2"
}
additional_tags = {
  Environment = "Practice",
  Owner       = "PandaLearnsTerraform"
}
