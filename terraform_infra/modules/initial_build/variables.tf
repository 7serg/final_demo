variable "aws_region" {
  default = "eu-central-1"
}

variable "bucket_name" {
  type = string
}

variable "env" {
  default = "dev"
}

variable "app_name" {
  type    = string
  default = "nginx-app"
}

variable "image_tag" {
  type    = string
  default = "v1.0.0"
}

variable "working_dir" {
  description = "directory for where files for initial build are located"

}
