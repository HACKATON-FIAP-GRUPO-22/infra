provider "aws" {
  alias  = "us_east"
  region = "us-east-1"
}

resource "aws_s3_bucket" "repo-videos" {
  provider = aws.us_east
  bucket = "repo-videos-fiap"
  force_destroy = true
}