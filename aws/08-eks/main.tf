provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}


resource "aws_eks_cluster" "demo1" {
  name     = "demo1"
  role_arn = aws_iam_role.eks-iam-tf-role.arn

  vpc_config {
    subnet_ids = ["subnet-007d477d3b2570bac", "subnet-0e6dd691631b69487"]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-iam-tf-role-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-iam-tf-role-AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.demo1.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.demo1.certificate_authority[0].data
}
