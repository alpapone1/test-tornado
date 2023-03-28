terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.15"
    }
  }

  required_version = ">= 1.0.5"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region

}
