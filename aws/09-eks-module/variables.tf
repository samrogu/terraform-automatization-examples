variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "type-instance" {
  default     = "t3.micro"
  description = "Tipo instancia"
}

variable "vpc-id" {
  default = "vpc-061851131e19eb723"
  description = "Add vpc"
}