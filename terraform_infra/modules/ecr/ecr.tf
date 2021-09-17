/*
provider "aws" {
  region = var.aws_region
}


terraform {
  backend "s3" {
    bucket = var.bucket_name
    region = var.aws_region
    #region = "eu-central-1"
    key = "staging/infrastructure/terraform.tfstate"
  }
}
*/


resource "aws_ecr_repository" "ecr_repository" {
  name = "${var.app_name}-${var.env}"
}
