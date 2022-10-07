
resource "aws_ecr_repository" "demo" {
  name                 = "cloudscape-demo"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
