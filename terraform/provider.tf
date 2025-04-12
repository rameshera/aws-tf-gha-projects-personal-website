provider "aws" {
  region = "us-east-1" # to use ACM with CloudFront
}

terraform {
  backend "s3" {
    bucket         = "tf-resource-ga"
    region         = "us-east-1"
    key            = "github-actions/terraform1.tfstate"
    encrypt        = true
    dynamodb_table = "tf-resources-ga"
  }
}
