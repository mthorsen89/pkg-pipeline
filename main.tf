module "pkg_container_builder" {
  source = "./container-builder-tf"
  container_builder_github_owner = "${var.container_builder_github_owner}"
  container_builder_github_repo = "${var.container_builder_github_repo}"
  container_builder_github_branch = "${var.container_builder_github_branch}"
  container_builder_s3_bucket = "${var.container_builder_s3_bucket}"
}

/*
module "pkg_builder_tester" {
  source = "./pkg-builder-tester-tf"
  pkg_builder_tester_github_owner = "${var.pkg_builder_tester_github_owner}"
  pkg_builder_tester_github_repo = "${var.pkg_builder_tester_github_repo}"
  pkg_builder_tester_github_branch = "${var.pkg_builder_tester_github_branch}"
}
*/
