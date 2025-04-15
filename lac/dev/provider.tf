terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57.0"
    }
  }

  # Comment backend code during the first init process
  backend "s3" {
    bucket         = "terraform-manager-apnortheast2-tfstate"
    key            = "terraform/xIaC/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}
