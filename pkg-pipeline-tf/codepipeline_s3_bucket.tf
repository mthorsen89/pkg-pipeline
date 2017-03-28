resource "aws_s3_bucket" "codepipeline_s3_bucket" {
  bucket = "${var.codepipeline_s3_bucket}"
  acl    = "private"
}
