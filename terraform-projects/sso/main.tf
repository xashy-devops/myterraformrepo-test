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

#################################