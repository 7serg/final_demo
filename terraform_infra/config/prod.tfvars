env               = "prod"
app_name          = "nginx-in-prod"
aws_profile       = "default"
aws_account       = "182009040698"
aws_region        = "eu-central-1"
bucket_name       = "my-nginx-app-prod-eu-central-1"
image_tag         = "v1.0.0"
repo_url          = "https://github.com/7serg/webtest"
branch_pattern    = "main"
git_trigger_event = "PUSH"
app_count         = 3
