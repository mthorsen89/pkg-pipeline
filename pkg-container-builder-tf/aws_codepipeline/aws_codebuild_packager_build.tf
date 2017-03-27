resource "aws_codebuild_project" "build_pkg_container" {
  name         = "Build_Package_Container"
  description  = "This will build the container that will be used to build packages"
  build_timeout      = "10"
  service_role = "${aws_iam_role.codebuild_role.arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/docker:1.12.1"
    type         = "LINUX_CONTAINER"

    environment_variable {
      "name"  = "NAME"
      "value" = "pkg_builder_container"
    }
  }

  source {
    type     = "CODEPIPELINE"
  }

  tags {
    "Environment" = "Test"
  }
}
