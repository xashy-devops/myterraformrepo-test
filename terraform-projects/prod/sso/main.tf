
provider "aws" { 
  region  = "us-east-2"
}

terraform {
  backend "s3" {
    bucket         = "terraform-project-bucket-xashy-prod"
    key            = "sso/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}

# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "xashy-vpc"
#   }
# }

###################################@@@@@@@@@@@@@@@@@@@@@@@@@@
