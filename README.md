# Our blog

## How does this work

We generate a static website using Hugo and upload it to an AWS S3 bucket.
Then it is served through AWS CloudFront, which also handles HTTPS and other stuff.

In order to keep repo size low, photos are hosted in a different S3 bucket and
synchronised with the `static/img` folder manually using AWS CLI.
