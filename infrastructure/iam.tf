resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "example-oai"
}

#resource "aws_s3_bucket_policy" "cdn-cf-bucket-policy" {
#  bucket = "steven-challenge2"
#  policy = "${file("cdn-cf-policy.json")}"
#}

#data "aws_iam_policy_document" "cdn-cf-policy" {
#  statement {
#    sid = "1"
#    principals {
#      type        = "AWS"
#      identifiers = [aws_cloudfront_origin_access_identity.oai.iam_arn]
#    }

#    actions = [
#      "s3:GetObject"
#    ]

#    resources = [
#      "arn:aws:s3:::steven-challenge/*",
#      "arn:aws:s3:::steven-challenge2/*"
#    ]
#  }
#}

#      "arn:aws:s3:::{aws_s3_bucket.steven-challenge-bucket2.arn.id}/*",
#      "arn:aws:s3:::steven-challenge/*",
#      "arn:aws:s3:::steven-challenge2/*"

