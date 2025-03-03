terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.88.0"
    }
  }
  backend "s3" {
    bucket         = "swetha-tf-remote-state"
    key            = "vpc-module-test"
    region         = "us-east-1"
    dynamodb_table = "swetha-tf-locking"
  }
}
#provide authentication here
provider "aws" {
  region = "us-east-1"
}
terraform {

}
