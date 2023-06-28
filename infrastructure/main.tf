terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    # access_key = "${var.aws_access_key}"
    # secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
    shared_credentials_files = ["/home/sedwards/.aws/credentials"]
}

