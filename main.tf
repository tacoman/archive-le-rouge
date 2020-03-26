provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "archive-le-rouge"
  acl    = "private"

  lifecycle_rule {
    id      = "upload"
    enabled = true

    prefix = "upload/"

    transition {
      days          = 0
      storage_class = "GLACIER"
    }
  }
}