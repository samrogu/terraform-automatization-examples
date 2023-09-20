source "amazon-ebs" "linux" {

  # AWS AMI data source lookup 
  source_ami_filter {
    filters = {
      name                = "al2023-ami-*-x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]

  }

  # AWS EC2 parameters
  ami_name      = "tomcat-et-${regex_replace(timestamp(), "[- TZ:]", "")}"
  instance_type = "t3.micro"
  region        = "us-east-2"
  subnet_id     = var.subnet_id
  vpc_id        = var.vpc_id
  associate_public_ip_address = true

  # provisioning connection parameters
  communicator                 = "ssh"
  ssh_username                 = var.ssh_username

  tags = {
    Environment     = "prod"
    Name            = "tomcat-et-${regex_replace(timestamp(), "[- TZ:]", "")}"
    PackerBuilt     = "true"
    PackerTimestamp = regex_replace(timestamp(), "[- TZ:]", "")
    Service         = "tomcat"
  }
} 