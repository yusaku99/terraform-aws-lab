# 1. AWS Provider Configuration & Remote Backend
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # 💡 backend "s3" ကို ဒီ terraform block ထဲမှာ ထည့်ရပါမယ်
  backend "s3" {
    bucket         = "yuzana-tf-state-bucket-2026"
    key            = "dev/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}