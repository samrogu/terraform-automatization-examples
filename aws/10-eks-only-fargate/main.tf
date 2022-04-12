terraform {
  backend "s3" {
    #Replace this with your bucket name!
    bucket         = "demo-terrara"
    key            = "eks/fargate/terraform.tfstate"
    region         = "us-east-2"
    #Replace this with your DynamoDB table name!
    dynamodb_table = "tf-up-and-run-locks"
    encrypt        = true
  }

}

module "vpc" {
  source             = "./vpc"
  name               = var.name
  environment        = var.environment
  cidr               = var.cidr
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  availability_zones = var.availability_zones
}

module "eks" {
  source          = "./eks"
  name            = var.name
  environment     = var.environment
  region          = var.region
  k8s_version     = var.k8s_version
  vpc_id          = module.vpc.id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
  kubeconfig_path = var.kubeconfig_path
  security_group_eks = module.vpc.default_security_group_id
}

module "ingress" {
  source       = "./ing"
  name         = var.name
  environment  = var.environment
  region       = var.region
  vpc_id       = module.vpc.id
  cluster_id   = module.eks.cluster_id
  ingress_depends_on = module.eks.aws_fargate
}
