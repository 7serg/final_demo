# Deploy a Web Application in Docker Container on AWS Using Terraform
This page describes how to deploy a web application in Docker container on AWS using Terraform.



## Description
This solution was created in order to demonstarate the way of deployment a web application and its cloud infrastructure on AWS by means of Terraform.

## Folder and Files
+ /presentation -  presentation of the project
+ /web - web application content directory
+ /terraform_infra - the directory where all the terraform code can be found.
    + /config - the derictory where prod.tfvars and dev.tf.vars are located.
    secret.tfvars should be added to this directory and itshould be storedon your local machine due to security measures.

## Preparation

+ Create an account on AWS
+ Create an user with required permissions using AWS IAM
+ Install the required version of Terraform, AWS CLI, and Docker
+ Download the repo content
+ Obtain Github token
+ Create secret.tfvars and add next content "github_oauth_token = YOUR GITHUB TOKEN"
+ Change variable values in *.tfvars

### Terraform State and Bucket

The next step means Terraform bucket creation. The main idea is next. First, you should create a bucket, then you should move your existing Terraform state to the bucket.

That means Terraform should create state file locally during bucket creation. Then state can be moved to a bucket.

First, you need to update ./terraform.tffile. You should comment out backend configuration.

 Just comment out. Save the file and run bucket creation:
 Navigate to terraform_infra directory and run the following command

terraform init
terraform plan -target=module.s3_remote_state --var-file=./config/dev.tfvars

Verify this plan and run apply command:
terraform apply -target=module.s3_remote_state --var-file=./config/dev.tfvars

The next step is copying state into created bucket. Terraform can do it itself, just uncomment lines you commented before bucket creation and run terraform init.
Terraform will prompt you to copy the exisitng tfstate file to the remote backend.

### Infrastructure Deployment

Terraform will create the next resources:

ECR repository
Build an image and push it to a new repo
ECS Cluster
Codebuild job

Naviagete to /terraform_infra directory and run the following commands

```
terraform init
terraform apply -target=module.ecr_repository --var-file=./config/dev.tfvars
terraform apply -target=module.first_build --var-file=./config/dev.tfvars
terraform apply -target=module.ecs_cluste --var-file=./config/dev.tfvars
terraform apply -target=module.codebuild --var-file=./config/dev.tfvars --var-file=./config/secret.tfvars
```
So, you should run destroy for modules one by one in reverse order of deployment

```
terraform apply -target=module.codebuild --var-file=./config/dev.tfvars --var-file=./config/secret.tfvars
terraform apply -target=module.ecs_cluste --var-file=./config/dev.tfvars
terraform apply -target=module.first_build --var-file=./config/dev.tfvars
terraform apply -target=module.ecr_repository --var-file=./config/dev.tfvars
```
