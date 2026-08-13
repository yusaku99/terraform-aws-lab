terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # S3 Backend ကို ခေတ္တ comment ခံထားပါ
  # backend "s3" {
  #   bucket         = "yuzana-tf-state-bucket-2026"
  #   key            = "exxon-platform/terraform.tfstate"
  #   region         = "ap-southeast-1"
  #   dynamodb_table = "terraform-state-locks"
  # }
}

provider "aws" {
  region = var.aws_region
}