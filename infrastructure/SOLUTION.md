### Solution

For a static application I wouldn't use a webserver or container but a CDN distribution 
such as CloudFront of the static resource served from an Object Store like s3.

### Walk through

Create the following in terraform 
  - create s3bucket(world read/no write)
	Commands:
		place index.html in bucket

  - create self-signed cert in aws cert manager
  - create cloudfront distribution
	asscotate self-signed cert
	register s3bucket as source

   TODO:
	evaluate security
	evaluate scaling

