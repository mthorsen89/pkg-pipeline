resource "aws_codebuild_project" "build_package_build" {
  name         = "build_package"
  description  = "This will build the a contaner"
  build_timeout      = "20"
  service_role = "${aws_iam_role.container_builder_codebuild_role.arn}"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "${var.container_builder_ecr_repo}/package-builder-container:latest"
    type         = "LINUX_CONTAINER"

    environment_variable {
      "name"  = "NAME"
      "value" = ""
    }
    environment_variable {
      "name"  = "VERSION"
      "value" = ""
    }
  }

  source {
    type     = "CODEPIPELINE"
  }

  tags {
    "Environment" = "Test"
  }
}
