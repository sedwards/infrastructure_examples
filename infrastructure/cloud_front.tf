resource "aws_cloudfront_distribution" "cdn" {
  viewer_certificate {
    acm_certificate_arn = "${aws_acm_certificate.default.0.arn}"
    ...
  }  ...
}

