resource "aws_s3_bucket" "package_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "private"
}
