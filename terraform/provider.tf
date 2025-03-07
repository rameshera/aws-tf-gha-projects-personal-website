provider "aws" {

}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws",
      version = "5.76.0"
    }
  }
  
  backend "s3" {
    bucket         = "tf-resources-gha"
    region         = "us-east-1"
    key            = "github-actions/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "tf-resources-gha-lock"
  }
}
