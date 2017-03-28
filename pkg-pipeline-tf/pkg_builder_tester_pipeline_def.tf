resource "aws_codepipeline" "pkg_builder_tester_pipeline" {
  name     = "Package_Builder_Tester"
  role_arn = "${aws_iam_role.container_builder_codepipeline_role.arn}"

  artifact_store {
    location = "${aws_s3_bucket.codepipeline_s3_bucket.bucket}"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["package_definition"]

      configuration {
        Owner      = "${var.pkg_builder_tester_github_owner}"
        Repo       = "${var.pkg_builder_tester_github_repo}"
        Branch     = "${var.pkg_builder_tester_github_branch}"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["package_definition"]
      output_artifacts = ["built_package"]
      version         = "1"

      configuration {
        ProjectName = "build_package"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["built_package"]
      output_artifacts = ["release_package"]
      version         = "1"

      configuration {
        ProjectName = "test_package"
      }
    }
  }
}
