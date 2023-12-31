resource "aws_cloudfront_distribution" "static_http_distribution" {
  origin {
                               # fixme: We can derive this somehow
    domain_name              = "steven-challenge3.s3.us-east-2.amazonaws.com"
    # origin_access_control_id = aws_cloudfront_origin_access_control.default.id
    # s3_origin_config
    origin_id               = "${aws_s3_bucket.steven-challenge-bucket3.bucket}"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some comment"
  default_root_object = "index.html"

  # Logging disabled for now, this is a free account
  #logging_config {
  #  include_cookies = false
  #  bucket          = "mylogs.s3.amazonaws.com"
  #  prefix          = "/"
  #}

  # FIXME: If we had a proper domain, route53 DNS and could use our own SSL
  # We could do this
  #aliases = ["steven-challenge.challenge.local", "steven-challenge.local"]

  default_cache_behavior {
    # allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${aws_s3_bucket.steven-challenge-bucket3.bucket}" 

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # Examples of ordered cache behavior
  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = "/content/immutable/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = "${aws_s3_bucket.steven-challenge-bucket3.bucket}"

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  # Cache behavior with precedence 1
  ordered_cache_behavior {
    path_pattern     = "/content/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${aws_s3_bucket.steven-challenge-bucket3.bucket}" 

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_200"

  # Limit Access in regions we don't need to serve to save on distribution costs
  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    # Cannot use a Self-Signed-Cert here due to chain validation
    # acm_certificate_arn = "arn:aws:acm:us-east-1:950224154531:certificate/f058a6a1-e215-42bb-b5f4-104c9dd207b3"
    #ssl_support_method = "sni-only" or "vip"
    #ssl_support_method = "sni-only" # VIP dedicates IP address, at an additional cost 
  }
}

