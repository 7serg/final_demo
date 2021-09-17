output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket_domain_name
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.lock_state.name
}
