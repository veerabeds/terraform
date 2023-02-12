terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.38"
    }
  }
   backend "s3" {
    bucket = "statefilebucket"
    key    = "project/statefiles/data_extraction.tfstate"
    region = "us-east-1"
  #   access_key = var.AWS_ACCESS_KEY_ID 
  #   secret_key = var.AWS_SECRET_ACCESS_KEY
  #   }
  
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  # access_key = var.AWS_ACCESS_KEY_ID 
  # secret_key = var.AWS_SECRET_ACCESS_KEY
}

# variable "AWS_ACCESS_KEY_ID" {
#   type = string
# }
# variable "AWS_SECRET_ACCESS_KEY" {
#   type = string
# }