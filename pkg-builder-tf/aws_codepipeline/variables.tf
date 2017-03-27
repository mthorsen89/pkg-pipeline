variable "github_owner" {
  description = "Github User"
}

variable "github_repo" {
  description = "Github Repo"
}

variable "github_branch" {
  description = "Github Branch"
  default = "master"
}

variable "bucket_name" {
  default = "lndmrk-pkgs-us-west-2"
}
