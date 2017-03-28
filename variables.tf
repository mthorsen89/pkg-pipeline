variable "container_builder_github_owner" {
  description = "Container Builder Github User"
}

variable "container_builder_github_repo" {
  description = "Container Builder Github Repo"
  default     = "pkg-container-builder"
}

variable "container_builder_github_branch" {
  description = "Container Builder Github Branch"
  default     = "master"
}

variable "codepipeline_s3_bucket" {
  description = "Codepipeline S3 Bucket"
  default     = "codepipeline-us-west-2-89809825"
}

variable "container_builder_ecr_repo" {
  default = "package-builder-container"
}

variable "pkg_builder_tester_github_owner" {
  description = "Package Builder Github User"
}

variable "pkg_builder_tester_github_repo" {
  description = "Package Builder Github Repo"
  default     = "test-rpm"
}

variable "pkg_builder_tester_github_branch" {
  description = "Package Builder Github Branch"
  default     = "master"
}
