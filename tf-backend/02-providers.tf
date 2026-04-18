terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "panda-learns-cool-bucket-526e35019f91bc91"
    key    = "ec2-backend.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}
