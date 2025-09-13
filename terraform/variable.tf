locals {
  config = jsondecode(file("${path.module}/../env-config.json"))
}
variable "aws_region" {
  description = "AWS region"
  default     = local.config.aws_region
}

variable "cluster_name" {
  description = "EKS cluster name"
  default     = local.config.cluster_name
}

variable "repository_name" {
  description = "ECR Repository name"
  default     = local.config.ecr_repo
}
