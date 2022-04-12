provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "demo-vpc-tf"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
    Name = "demo-vpc-tf"
  }
}


#resource "aws_vpc" "demo-vpc-tf" {
#  cidr_block       = "10.0.0.0/24"
#  instance_tenancy = "default"

#  tags = {
#    Name = "demo-vpc-tf"
#  }
#}

#resource "aws_subnet" "public" {
#  count                           = length(var.public_subnet_cidrs)
#  vpc_id                          = aws_vpc.demo-vpc-tf.id
#  cidr_block                      = var.public_subnet_cidrs[count.index]
#}
