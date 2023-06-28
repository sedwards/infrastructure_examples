provider "aws" {
    # access_key = "${var.aws_access_key}"
    # secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
    shared_credentials_file = "/home/sedwards/.aws/credentials"
}

