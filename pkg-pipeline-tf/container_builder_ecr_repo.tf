resource "aws_ecr_repository" "container_builder" {
  name = "${var.container_builder_ecr_repo}"
}
