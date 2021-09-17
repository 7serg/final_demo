output "vpc_id" {
  value = module.ecs_cluster.vpc_id
}

output "lb_dns" {
  value = module.ecs_cluster.aws_lb_dns
}

output "repository_url" {
  value = module.ecr_repository.repository_url
}
