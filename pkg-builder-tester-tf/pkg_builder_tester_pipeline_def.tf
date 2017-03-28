resource "aws_codepipeline" "pkg_builder_tester_pipeline" {
  name     = "Package_Builder_Tester"
  role_arn = "${aws_iam_role.codepipeline_role.arn}"

  artifact_store {
    location = "${aws_s3_bucket.package_bucket.bucket}"
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
      output_artifacts = ["package"]

      configuration {
        Owner      = "${var.github_owner}"
        Repo       = "${var.github_repo}"
        Branch     = "${var.github_branch}"
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
      input_artifacts = ["package"]
      output_artifacts = ["built_package"]
      version         = "1"

      configuration {
        ProjectName = "package_builder"
      }
    }
  }
}
