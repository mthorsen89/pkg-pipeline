resource "aws_codepipeline" "container_builder_pipeline" {
  name     = "build_container"
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
      output_artifacts = ["container_definition"]

      configuration {
        Owner      = "${var.container_builder_github_owner}"
        Repo       = "${var.container_builder_github_repo}"
        Branch     = "${var.container_builder_github_branch}"
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
      input_artifacts = ["container_definition"]
      output_artifacts = ["built_container"]
      version         = "1"

      configuration {
        ProjectName = "build_container"
      }
    }
  }
}
