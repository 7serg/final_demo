provider "aws" {
  region = "eu-central-1"
}

module "s3_remote_state" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
}


module "ecr_repository" {
  source      = "./modules/ecr"
  app_name    = var.app_name
  env         = var.env
  bucket_name = var.bucket_name
}


module "first_build" {
  source      = "./modules/initial_build"
  aws_region  = var.aws_region
  bucket_name = var.bucket_name
  env         = var.env
  app_name    = var.app_name
  working_dir = "${path.root}/../web"
  image_tag   = var.image_tag

}


module "ecs_cluster" {
  source     = "./modules/ecs_cluster"
  aws_region = var.aws_region
  #  profile          = var.aws_profile
  bucket_name        = var.bucket_name
  env                = var.env
  app_name           = var.app_name
  app_count          = var.app_count
  ecr_repository_url = module.ecr_repository.repository_url
  image_tag          = var.image_tag
  taskdef_template   = "./modules/ecs_cluster/taskdef.json"

}


module "codebuild" {
  source             = "./modules/codebuild"
  bucket_name        = var.bucket_name
  vpc_id             = module.ecs_cluster.vpc_id
  subnets            = module.ecs_cluster.private_subnet_ids
  github_oauth_token = var.github_oauth_token
  env                = var.env
  app_name           = var.app_name
  repo_url           = var.repo_url
  git_trigger_event  = var.git_trigger_event
  branch_pattern     = var.branch_pattern
  build_spec_file    = "terraform_infra/config/buildspec.yml"

}
