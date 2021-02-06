# Startup Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {}

data "aws_ami" "centos8" {
  most_recent = true
  owners           = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["CentOS Linux 8"]
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

# Create a EC2 Instance
resource "aws_instance" "web" {
  ami           = data.aws_ami.centos8.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}