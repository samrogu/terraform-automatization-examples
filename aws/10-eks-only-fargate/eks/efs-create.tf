resource "aws_efs_file_system" "efs-eks" {
  creation_token = "${data.aws_eks_cluster.cluster.id}-efs"

  tags = {
    Name = "${data.aws_eks_cluster.cluster.id}-efs"
  }
}

resource "aws_efs_mount_target" "efs-eks" {
  count = 2
  file_system_id = aws_efs_file_system.efs-eks.id
  subnet_id = var.private_subnets.*.id[count.index]
  security_groups = [var.security_group_eks]
  depends_on = [
    aws_eks_cluster.main
  ]
}