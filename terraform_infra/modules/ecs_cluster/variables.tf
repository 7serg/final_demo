
variable "aws_region" {

  default = "eu-central-1"
}



variable "bucket_name" {
  type = string
}

variable "versioning" {
  type    = bool
  default = true
}


variable "vpc_cidr" {
  default     = "10.10.0.0/16"
  description = "VPC cidr block"
}

variable "env" {
  default = "dev"
}



variable "public_subnets_cidr" {
  description = "Public subnets"
  default = [
    "10.10.11.0/24",
    "10.10.12.0/24"
  ]

}


variable "private_subnets_cidr" {
  description = "Private subnets cidr"
  default = [
    "10.10.20.0/24",
    "10.10.21.0/24"
  ]
}


#ECS Service variables

variable "app_port" {
  default = 80
}


variable "fargate_cpu" {
  default = "256"
}

variable "fargate_memory" {
  default = "512"
}

variable "image_tag" {
  type    = string
  default = "v1.0.0"

}

variable "taskdef_template" {
  default = "taskdef.json"
}


variable "ecr_repository_url" {
  type = string
}

#defines how many tasks to run
variable "app_count" {
  default = 2

}

variable "app_name" {
  type = string
}
