terraform {

  # cloud {
  #   organization = "acme-cloud-demo"

  #   workspaces {
  #     name = "aws-infra"
  #   }
  # }

  required_providers {
    aws = {
      #source  = "hashicorp/aws"
      source  = "app.terraform.io/acme-cloud-demo/aws"
      version = "~> 4.26.0"
    }
  }

  required_version = ">= 1.2.7"
}
