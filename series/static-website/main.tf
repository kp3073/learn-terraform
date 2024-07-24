resource "aws_s3_bucket" "website" {
  bucket = "aws-s3-bucketkp307319911"
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.website.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid = "PublicReadGetObject",
          Effect = "Allow",
          Principal = "*",
          Action = "s3:GetObject",
          Resource = "arn:aws:s3:::${aws_s3_bucket.website.id}/*"
        }
      ]
    }
  )
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "html" {
  bucket = aws_s3_bucket.website.bucket
  key    = "index.html"
  source = "./index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "styles" {
  bucket = aws_s3_bucket.website.bucket
  key    = "styles.css"
  source = "./styles.css"
  content_type = "text/css"
}

output "websiteurl" {
  value = aws_s3_bucket_website_configuration.example.website_endpoint
}