provider "aws" {
  alias = "acm"  
  #version = "3.24"
  profile = "challenge_profile"
  region  = "${var.region}"
}

variable "acl_value" {
    default = "private"
}

variable "region" {
    default = "us-east-2"
    # us-east-1 is needed for ACM Certificates serving CloudFront
}

variable "bucket_name" {
  default = "steven-challenge2"
}

variable "domain" {
  default = "challenge.local"
}
