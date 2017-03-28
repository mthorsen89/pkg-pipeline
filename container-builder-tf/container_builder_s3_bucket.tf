resource "aws_s3_bucket" "container_builder_s3_bucket" {
  bucket = "${var.container_builder_s3_bucket}"
  acl    = "private"
}
