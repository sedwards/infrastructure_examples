### Solution

It is a trick question. 

For a purely static application that is publicly facing there should
be no application scaling, as it should be served and hosted at the edge via CDN

CDN performance can vary depending on the provider and their resources. 
AWS Cloudfront 

For a static application and webserver would do however I would have the CloudFront 
Distribution ingest the static content served from an Object Store such as s3.

### Walk through

Create the following in terraform 
  - create s3bucket(world read/no write)
    - encrypt s3 volume incase our 'Hello World' is something important
    - place index.html in bucket

  - upload self-signed cert to aws cert manager

  - create cloudfront distribution
	asscotate self-signed cert
	register s3bucket as source
        create WAF to limit access to 80 and 443

   TODO:
    create tests
    evaluate security
    evaluate scaling

