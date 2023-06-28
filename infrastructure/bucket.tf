module "s3" {
  source      = "./site"
}

locals {
  static_application = "${path.module}/site/index.html"
  #keyfile = "${path.module}/site/key.txt"
}

#resource "aws_s3_bucket_object" "encrypted-content" {
#  bucket      = "${var.bucket_name}"
#  source      = local.static_application
#  key		= "${aws_kms_key.s3_bucket_key2.arn}"
#  #key         = local.keyfile
#}

resource "aws_s3_bucket_object" "static-content" {
  bucket = aws_s3_bucket.steven-challenge-bucket3.id
  key    = "index.html"
  acl    = "public-read"
  source = "site/index.html"
  etag = filemd5("site/index.html")
}

#resource "aws_s3_bucket" "steven-challenge-bucket" {
#  bucket = "${var.bucket_name}"
#  acl = "public-read"
#}

resource "aws_s3_bucket" "steven-challenge-bucket3" {
  bucket = "${var.bucket_name3}"
  acl = "public-read"
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.steven-challenge-bucket3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#resource "aws_s3_bucket" "steven-challenge-bucket2" {
#  bucket = "${var.bucket_name2}"
#  acl = "${var.acl_value}"

#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        kms_master_key_id = aws_kms_key.s3_bucket_key2.arn
#        sse_algorithm     = "aws:kms"
#      }
#    }
#  }
#}

resource "aws_kms_key" "s3_bucket_key2" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_public_access_block" "steven-chalenge3" {
  bucket = aws_s3_bucket.steven-challenge-bucket3.id

  block_public_acls       = false
  block_public_policy     = false
}


#resource "aws_s3_bucket_public_access_block" "steven-chalenge2" {
#  bucket = aws_s3_bucket.steven-challenge-bucket2.id

#  block_public_acls       = true
#  block_public_policy     = true
#  ignore_public_acls      = true
#  restrict_public_buckets = true
#}

#resource "aws_s3_bucket_acl" "bucket_acl" {
#  count  = length(var.acl) != 0 ? 1 : 0
#  bucket = aws_s3_bucket.steven-challenge.id
#  acl    = var.acl
#}

