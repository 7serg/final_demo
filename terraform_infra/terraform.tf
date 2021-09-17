/*
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
*/

terraform {
  backend "s3" {
    bucket         = "my-nginx-app-prod-eu-central-1"
    region         = "eu-central-1"
    key            = "prod/infrastructure/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform-db-for-locking-state"
  }
  required_providers {
    aws = {
      version = "~> 3.58"
    }
  }
}




/*
terraform {
  backend "s3" {
    bucket = "my-nginx-app-development-eu-central-1"
    region = "eu-central-1"
    key    = "dev/infrastructure/terraform.tfstate"
  }
  required_providers {
    aws = {
      version = "~> 3.35"
    }
  }
}

*/
