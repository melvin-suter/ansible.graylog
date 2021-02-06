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

# Create a EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-0a75a5a43b05b4d5f"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}