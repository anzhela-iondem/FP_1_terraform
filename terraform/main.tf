# Create ECR
resource "aws_ecr_repository" "app" {
  name = var.ecr_repo_name
}



# Create EKS
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = "1.31"
  subnet_ids      = var.subnet_ids
  vpc_id          = var.vpc_id

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]   #Values are hardcoded, can be moved to variables section
      
      tags = {
        Name = "Node_Project1"
      }
    }
  }

# Public/private access
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs  # Public IP of external user access
  cluster_endpoint_private_access      = true

  tags = {
    Environment = var.env
    Terraform   = "true"
  }
}
