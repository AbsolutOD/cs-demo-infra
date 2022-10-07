output "arn" {
  value = aws_ecr_repository.demo.arn
}

output "registry_id" {
  value = aws_ecr_repository.demo.registry_id
}

output "repository_url" {
  value = aws_ecr_repository.demo.repository_url
}
