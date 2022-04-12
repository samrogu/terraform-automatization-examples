
resource "aws_security_group" "allow_eks_cluster" {
  name        = "xva-efsdata"
  description = "This will allow the cluster eks to access this volume and use it."
  vpc_id      = var.vpc_id

  ingress {
    description = "NFS For EKS Cluster eks efs"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    security_groups = [
      var.security_group_eks
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}