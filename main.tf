module "pkg_pipeline" {
  source = "./pkg-pipeline-tf"
  container_builder_github_owner = "${var.container_builder_github_owner}"
  container_builder_github_repo = "${var.container_builder_github_repo}"
  container_builder_github_branch = "${var.container_builder_github_branch}"
  container_builder_ecr_repo = "${var.container_builder_ecr_repo}"
  pkg_builder_github_owner = "${var.pkg_builder_github_owner}"
  pkg_builder_github_repo = "${var.pkg_builder_github_repo}"
  pkg_builder_github_branch = "${var.pkg_builder_github_branch}"
  codepipeline_s3_bucket = "${var.codepipeline_s3_bucket}"
}
