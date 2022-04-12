terraform {
  backend "s3" {
    #Replace this with your bucket name!
    bucket         = "demo-terrara"
    key            = "dc/s3/terraform.tfstate"
    region         = "us-east-2"
    #Replace this with your DynamoDB table name!
    dynamodb_table = "tf-up-and-run-locks"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-064ff912f78e3e561"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}