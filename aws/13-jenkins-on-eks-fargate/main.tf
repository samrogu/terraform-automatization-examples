terraform {
  backend "s3" {
    #Replace this with your bucket name!
    bucket         = "demo-terrara"
    key            = "eks/fargate/jenkins.tfstate"
    region         = "us-east-2"
    #Replace this with your DynamoDB table name!
    dynamodb_table = "tf-up-and-run-locks"
    encrypt        = true
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "jenkins" {
  name       = "jenkinsci"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"

  values = [
    "${file("values.yaml")}"
  ]
  set {
    name  = "rbac.create"
    value = "true"
  }
}