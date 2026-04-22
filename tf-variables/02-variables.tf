variable "region" {
  description = "Value of region"
  type        = string
  default     = "us-east-1"
}

variable "aws_instance_type" {
  description = "This is the type of instance I will create."
  type        = string
  # default     = "t3.micro"
  validation {
    condition     = var.aws_instance_type == "t3.micro" || var.aws_instance_type == "t3.small" || var.aws_instance_type == "t3.medium"
    error_message = "The aws_instance_type must be one of the following: t3.micro, t3.small, or t3.medium."
  }
}

variable "ec2_config" {
  description = "Configuration for EC2 instance root volume."
  type = object({
    root_volume_size = number
    root_volume_type = string
  })
  default = {
    root_volume_size = 30
    root_volume_type = "gp2"
  }
}

variable "additional_tags" {
  description = "Additional tags to apply to resources."
  type        = map(string)
  default = {
    Environment = "Practice"
    Owner       = "PandaLearnsTerraform"
  }

}
