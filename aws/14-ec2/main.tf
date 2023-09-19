

provider "aws" {
  region = var.region
  #shared_credentials_file = "../.aws/credentials"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "demo-terrara"
    key    = "fabrica/dev/vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

resource "aws_instance" "samrogu-instance" {
  ami = "ami-01103fb68b3569475"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnets1
  associate_public_ip_address = true
  user_data = "${file("init.sh")}"
  tags= {
    Name = "demo1"
    Environment = "Dev"
  }
  key_name = "samrogu-demo"
}

resource "aws_security_group" "sg" {
  name        = "demo1-sg"
  description = "Allow TCP/22"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  ingress {
    description = "Allow 22 from our public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 8080 from our public IP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "demo1-securitygroup"
  }
}