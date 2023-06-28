# Import existing certificate to acm
# Behavior is a little funky which prevents us from defining this in the locals
resource "aws_acm_certificate" "steven-challenge-cert" {
  certificate_body = "${file("${path.module}/site/steven_challenge.challenge.local.pem")}"
  private_key      = "${file("${path.module}/site/steven_challenge.challenge.local.key")}"

  # No Chain here, this is just a local self-signed
  # certificate_chain=file("inter.cer")
}

