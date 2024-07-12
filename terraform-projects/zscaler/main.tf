
provider "aws" {
  profile = "dev"  
  region  = "us-east-2"
}

terraform {
  backend "s3" {
    bucket         = "myproject-backend-terraform-bucket"
    key            = "zscaler/terraform.tfstate"
    profile        = "dev"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main-vpc"
  }
}

## i hope this works