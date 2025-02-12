terraform {

  # cloud {
  #   organization = "acme-cloud-demo"

  #   workspaces {
  #     name = "aws-infra"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.86.1"
    }
  }
}
