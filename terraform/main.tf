provider "aws" {
  region = var.aws_region
}

#ECR Repository
resource "aws_ecr_repository" "devops" {
  name = var.repository_name
}

#VPC + Subnets + Networking
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_dns_hostnames = true
}

data "aws_availability_zones" "available" {}

#EKS Cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  # EKS Control Plane
  cluster_endpoint_public_access = true

  # Managed Node Group
  eks_managed_node_groups = {
    devops_nodes = {
      desired_size = 2
      min_size     = 1
      max_size     = 3

      instance_types = ["t2.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }
}
