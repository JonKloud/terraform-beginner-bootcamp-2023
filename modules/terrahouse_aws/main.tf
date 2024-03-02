terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.38.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}