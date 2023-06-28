#!/bin/bash

openssl req \
	-x509 \
	-newkey \
	rsa:4096 \
	-keyout steven_challenge.challenge.local.key \
	-out steven_challenge.challenge.local.pem \
	-sha256 \
	-days 3650 \
	-nodes \
	-subj "/C=XX/ST=StateName/L=CityName/O=Multiplan/OU=DevOps/CN=steven_challenge.challenge.local"

# Useful for debugging
#openssl x509 -in steven_challenge.challenge.local.pem -text | head -n 15

