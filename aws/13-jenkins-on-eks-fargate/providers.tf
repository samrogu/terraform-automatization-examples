terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.9.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.5.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.10.0"
    }
  }
}
provider "aws" {
  region  = var.region
}