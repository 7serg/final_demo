resource "aws_s3_bucket" "my_bucket" {
  #  bucket_prefix = var.bucket_prefix
  bucket = var.bucket_name

  versioning {
    enabled = var.versioning
  }
  lifecycle {
    prevent_destroy = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = var.bucket_description
  }
}

resource "aws_dynamodb_table" "lock_state" {
  name         = "terraform-db-for-locking-state"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
