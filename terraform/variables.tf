# variables.tf

variable "region" {
  description = "AWS region where EKS and ECR will be created"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "env" {
    description = "Define the environment"
    type = string
}

variable "vpc_id" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "vpc-05c2bf559cc164f3a"
}

variable "subnet_ids" {
  description = "List of public subnets: 172.31.0.0/20, 172.31.32.0/20"
  type        = list(string)
  default     = [ "subnet-0c133a1d107959080", "subnet-0b40651b733a1a8e2" ]
}

variable "ecr_repo_name" {
    description = "Name of the ECR repository"
    type = string
}

variable "cluster_endpoint_public_access_cidrs" {
  type = list(string)
  default = ["0.0.0.0/0"] # Or your IP/CIDR
}







# variable "private_subnet_cidrs" {
#   description = "List of private subnet CIDRs"
#   type        = list(string)
# }

# variable "node_group_instance_types" {
#   description = "List of EC2 instance types for the node group"
#   type        = list(string)
#   default     = ["t3.medium"]
# }

# variable "desired_capacity" {
#   description = "Desired number of worker nodes"
#   type        = number
#   default     = 2
# }

# variable "min_size" {
#   description = "Minimum number of worker nodes"
#   type        = number
#   default     = 1
# }

# variable "max_size" {
#   description = "Maximum number of worker nodes"
#   type        = number
#   default     = 3
# }

# variable "ecr_repo_name" {
#   description = "Name of the ECR repository for the Node.js app"
#   type        = string
# }

# variable "tags" {
#   description = "Common tags to apply to resources"
#   type        = map(string)
#   default     = {
#     Project = "eks-gitops-node-app"
#     Owner   = "your-name"
#   }
# }
