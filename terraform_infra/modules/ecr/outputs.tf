output "repository_url" {
  value = aws_ecr_repository.ecr_repository.repository_url
}

/*
output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}
*/
