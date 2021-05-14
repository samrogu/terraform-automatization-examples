terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "../.aws/credentials"
}

resource "aws_instance" "samrogu-instance" {
  ami = "ami-034945abef04358a5"
  instance_type = "t2.micro"
  tags= {
    Name = "demo1"
    Environment = "Dev"
  }
}