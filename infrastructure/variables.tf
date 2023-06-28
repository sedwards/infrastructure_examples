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
  default = "steven-challenge"
}

variable "bucket_name2" {
  default = "steven-challenge2"
}

variable "bucket_name3" {
  default = "steven-challenge3"
}

#variable ownership { type = string }

variable "domain" {
  default = "challenge.local"
}

# This is wrong, but my accout is limited to us-east-2 for most 
# resources.
variable "aws_acm_certificate_arm" {
  default = "some_arm_us_east_1"
}

