provider "aws" {
  profile = "prod"  
  region  = "us-east-2"
}

terraform {
  backend "s3" {
    bucket         = "terraform-project-bucket-xashy-prod"
    key            = "sso/terraform.tfstate"
    profile        = "prod"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}

resource "aws_vpc" "main" {
  cidr_block = "20.0.10.0/16"
  tags = {
    Name = "main-vpc"
  }
}