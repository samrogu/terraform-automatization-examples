data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = [
      "amzn2-ami-hvm-*-x86_64-gp2",
    ]
  }
  filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
  }
}

resource "aws_instance" "jenkins-instance" {
  #ami             = "${data.aws_ami.amazon-linux-2.id}"
  ami             = var.instance_ami
  instance_type   = "t2.medium"
  key_name        = "${var.keyname}"
  #vpc_id          = "${aws_vpc.development-vpc.id}"
  vpc_security_group_ids = ["${aws_security_group.sg_allow_ssh_jenkins.id}"]
  subnet_id          = "${aws_subnet.public-subnet-1.id}"
  #name            = "${var.name}"
  user_data = "${file("install_jenkins.sh")}"

  associate_public_ip_address = true
  tags = {
    Name = "Jenkins-Instance"
  }
}