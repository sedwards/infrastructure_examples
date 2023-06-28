### Solution

It is a trick question. 

For purely static applicationis and content that are  publicly facing there should
be no application scaling at the web-server layer, as it should be served from an
environment of minimal resources and hosted at the edge via CDN.

A CDN will provide much greater access to resources and performance for serving
content at the edge than we could ever do by creating our own web-server infrastructure.

CDN performance can vary depending on the provider and their resources. 

AWS Cloudfront 

For a static application and webserver would do however I would have the CloudFront 
Distribution ingest the static content served from an Object Store such as s3.

See simplified_output.txt for an overview

### Walk through

Create the following in terraform 
  - create s3bucket(world read/no write)
    - encrypt s3 volume incase our 'Hello World' is something important
    - place index.html in bucket

  - upload self-signed cert to aws cert manager

  - create cloudfront distribution
	asscotate self-signed cert
	register s3bucket as source

   TODO:
    create tests


