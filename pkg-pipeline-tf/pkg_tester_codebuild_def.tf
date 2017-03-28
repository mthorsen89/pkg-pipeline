resource "aws_codebuild_project" "pkg_tester_build" {
  name         = "test_package"
  description  = "This will install package and test"
  build_timeout      = "20"
  service_role = "${aws_iam_role.container_builder_codebuild_role.arn}"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "${var.container_builder_ecr_repo}/package-builder-container:latest"
    type         = "LINUX_CONTAINER"
  }

  source {
    type     = "CODEPIPELINE"
  }

  tags {
    "Environment" = "Test"
  }
}
