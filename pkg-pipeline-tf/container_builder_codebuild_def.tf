resource "aws_codebuild_project" "container_builder_build" {
  name          = "build_container"
  description   = "This will build the a contaner"
  build_timeout = "20"
  service_role  = "${aws_iam_role.container_builder_codebuild_role.arn}"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/docker:1.12.1"
    type         = "LINUX_CONTAINER"

    environment_variable {
      "name"  = "NAME"
      "value" = "pkg_builder_container"
    }

    environment_variable {
      "name"  = "VERSION"
      "value" = "0.0.1"
    }

    environment_variable {
      "name"  = "REPO"
      "value" = "${aws_ecr_repository.container_builder.repository_url}"
    }
  }

  source {
    type = "CODEPIPELINE"
  }

  tags {
    "Environment" = "Test"
  }
}
