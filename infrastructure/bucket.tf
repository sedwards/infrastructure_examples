provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
}

module "s3" {
    source = "objects"
    bucket_name = "sedwards_example"
}

resource "aws_s3_bucket" "sedwards_example" {
    bucket = "${var.bucket_name}" 
    acl = "${var.acl_value}"   
}
