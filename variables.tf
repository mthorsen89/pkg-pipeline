variable "container_builder_github_owner" {
  description = "Container Builder Github User"
  default = ""
}

variable "container_builder_github_repo" {
  description = "Container Builder Github Repo"
  default = "pkg-container-builder"
}

variable "container_builder_github_branch" {
  description = "Container Builder Github Branch"
  default = "master"
}

variable "container_builder_s3_bucket" {
  description = "Container Builder S3 Bucket"
  default = "codepipeline-423524524"
}
/*
variable "pkg_builder_tester_github_owner" {
  description = "Package Builder Github User"
  default = ""
}

variable "pkg_builder_tester_github_repo" {
  description = "Package Builder Github Repo"
  default = "pkg-builder-test"
}

variable "pkg_builder_tester_github_branch" {
  description = "Package Builder Github Branch"
  default = "master"
}
*/
