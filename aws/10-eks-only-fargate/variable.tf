variable "name" {
  description = "Set name of your stack"
  default     = "eks-demo-fargate"
}

variable "environment" {
  description = "environment, e.g. \"prod\""
  default     = "prod"
}

variable "region" {
  description = "the AWS region in which resources are created"
  default     = "us-east-2"
}

variable "availability_zones" {
  description = "a comma-separated list of availability zones, defaults to all AZ of the region"
  default     = ["us-east-2a", "us-east-2b"]
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "a list of CIDRs for private subnets in your VPC"
  default     = ["10.0.0.0/20", "10.0.32.0/20", "10.0.64.0/20"]
}

variable "public_subnets" {
  description = "a list of CIDRs for public subnets in your VPC"
  default     = ["10.0.16.0/20", "10.0.48.0/20", "10.0.80.0/20"]
}

variable "kubeconfig_path" {
  description = "Path where the config file for kubectl"
  default     = "~/.kube"
}

variable "k8s_version" {
  description = "kubernetes version"
  default = ""
}