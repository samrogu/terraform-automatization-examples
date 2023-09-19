terraform {
  backend "s3" {
    bucket = "demo-terrara"
    key    = "fabrica/dev/ec2/demo1/terraform.tfstate"
    region = "us-east-2"
  }
}