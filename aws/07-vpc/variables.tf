variable "public_subnet_cidrs" {
    type = list(string)
    default = [
        "10.0.0.0/26",
        "10.0.0.64/26",
        "10.0.0.128/26",
    ]
  
}