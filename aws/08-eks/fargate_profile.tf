resource "aws_eks_fargate_profile" "example" {
  cluster_name           = aws_eks_cluster.demo1.name
  fargate_profile_name   = "default"
  pod_execution_role_arn = aws_iam_role.eks-fg-iam-tf-role.arn
  subnet_ids             = ["subnet-007d477d3b2570bac", "subnet-0e6dd691631b69487"]

  selector {
    namespace = "default"
  }
}