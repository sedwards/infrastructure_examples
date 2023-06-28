module "s3" {
  source      = "./site"
}

locals {
  static_application = "${path.module}/site/index.html"
  #keyfile = "${path.module}/site/key.txt"
}

resource "aws_s3_bucket_object" "static-application" {
  bucket      = "${var.bucket_name}"
  source      = local.static_application
  key		= "${aws_kms_key.s3_bucket_key2.arn}"
  #key         = local.keyfile
}

resource "aws_s3_bucket" "steven-challenge-bucket2" {
  bucket = "${var.bucket_name}"
  acl = "${var.acl_value}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.s3_bucket_key2.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_kms_key" "s3_bucket_key2" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

