terraform {
  #cloud {
  #  organization = "TerraformBB"
#
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.38.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

provider "random" {
  # Configuration options
}
