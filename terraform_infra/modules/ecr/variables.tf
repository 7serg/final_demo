variable "aws_region" {
  default = "eu-central-1"
}

variable "bucket_name" {
  type = string
  #default = "malkosergeyseconddemoecs"
}

variable "env" {
  default = "dev"
}

variable "app_name" {
  type    = string
  default = "nginx-app"
}
