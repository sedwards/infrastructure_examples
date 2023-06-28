module "s3" {
    source = "./site"
}

resource "aws_s3_bucket" "steven-challenge" {
    bucket = "${var.bucket_name}" 
    acl = "${var.acl_value}"   
}

