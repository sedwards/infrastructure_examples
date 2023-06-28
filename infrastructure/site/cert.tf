# This is a bit of a hack due to limitations on my AWS Account
# CloudFront only supports using us-east-1 for certificates
# but my account is limited mostly to resources in us-east-2

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
    profile = "challenge_profile"
    region = "${var.region}"
    shared_credentials_files = ["/home/sedwards/.aws/credentials"]
}

variable "acl_value" {
    default = "private"
}

variable "region" {
    default = "us-east-1"
    # us-east-1 is needed for ACM Certificates serving CloudFront
}


# Import existing certificate to acm
# Behavior is a little funky which prevents us from defining this in the locals
resource "aws_acm_certificate" "steven-challenge-cert" {
  certificate_body = "${file("${path.module}/steven_challenge.challenge.local.pem")}"
  private_key      = "${file("${path.module}/steven_challenge.challenge.local.key")}"

  # No Chain here, this is just a local self-signed
  # certificate_chain=file("inter.cer")
}

