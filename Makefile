.PHONY: dev deploy sync_images help

dev: ## Serve site from memory and watch changes
	hugo -w --buildDrafts serve

sync_images: ## Sync images with the S3 bucket
	aws s3 sync "./static/img/" s3://joc-gafo-binaries
	aws s3 sync s3://joc-gafo-binaries "./static/img/"

deploy: ## Build and deploy site to the primary S3 bucket, invalidate CloudFront cache
	aws configure set preview.cloudfront true
	rm -rf "./public/"
	hugo
	aws s3 sync --acl public-read --sse --delete "./public/" s3://www.joc-gafo.org
	aws cloudfront create-invalidation --distribution-id EPNLPWEUBLA8I --paths '/*'

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'
