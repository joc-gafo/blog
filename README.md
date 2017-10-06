# Our blog

## How does this work

We generate a static website using Hugo and upload it to an AWS S3 bucket.
Then it is served through AWS CloudFront, which also handles HTTPS and other stuff.

In order to keep repo size low, photos are hosted in a different S3 bucket and
synchronised with the `static/img` folder manually using AWS CLI.

## Contributing

1. Create a new Markdown file in `content/portfolio`.
   Copy the preamble (stuff between `+++`) from an existing post.
1. Edit the preamble: title, timestamp etc.
1. Create content! You can see the changes live at `localhost:1313` if you run `make dev`.
1. When you're done:
    * If you have AWS credentials, you can build locally and deploy the changes to
      S3 by typing `make deploy`. CloudFront cache will be invalidated as well.
    * If not, you can commit and push to GitHub. Travis CI will build and deploy on tag commits.
      _However, we do not want to abuse Travis' free service!_
      Please build and deploy locally if you can.
1. ???
1. PROFIT!
