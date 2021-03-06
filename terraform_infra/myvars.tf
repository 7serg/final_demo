variable "aws_region" {

  default = "eu-central-1"
}

variable "aws_profile" {
  default = "default"
}

variable "aws_account" {
  type = string
}

variable "bucket_name" {
  type = string

}

variable "versioning" {
  type    = bool
  default = true
}


variable "tags" {
  type = map(any)
  default = {
    Name        = "demoecs",
    environment = "staging"
  }
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

variable "working_dir" {
  description = "directory for where files for initial build are located"
  default     = ""
}

#ECS service variables

variable "app_port" {
  default = 80
}

variable "task_definition_name" {
  type    = string
  default = "nginxtask"
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
  type    = string
  default = ""
}


#defines how many tasks to run
variable "app_count" {
  default = 2

}

variable "app_name" {
  type = string
}

variable "github_oauth_token" {
  description = "Github OAuth token with repo access permissions"
  default     = ""
}

variable "branch_pattern" {
  default = "^refs/heads/devenv$"
}

variable "git_trigger_event" {
  default = "PUSH"
}

variable "repo_url" {
  description = "Url of the GitHub repository"
  default     = "https://github.com/7serg/webtest"

}

variable "build_spec_file" {
  description = "Path to the buldspecfile"
  default     = "buildspec.yml"

}
