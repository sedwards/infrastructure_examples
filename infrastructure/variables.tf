provider "aws" {
  alias = "acm"  
  version = "3.24"
  profile = "challenge_profile"
  region  = "${var.region}"
}

variable "acl_value" {
    default = "private"
}

variable "region" {
    default = "us-east-2"
}

variable "bucket_name" {
  default = "steven-challenge"
}
