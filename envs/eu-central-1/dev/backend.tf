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

/*
  backend "s3" {
    bucket         = "all-terraform-state-files"
    key            = "${var.environment}/${var.instance_name}-${var.aws_region}-ec2.tfstate"
    region         = "${var.aws_region}"
   # encrypt        = "true"
   # kms_key_id     = "arn:aws:kms:eu-central-1:019496914213:key/mrk-30ad3d24aaed4ec199b7bcab4f2b53e5"
    dynamodb_table = "${var.instance_name}-all-terraform-lock"
  }
*/


