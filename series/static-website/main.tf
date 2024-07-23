resource "aws_s3_bucket" "website" {
  bucket = "aws-s3-bucketkp307319911"
}
#
resource "aws_s3_object" "html" {
  bucket = aws_s3_bucket.website.bucket
  key    = "index.html"
  source = "./index.html"
}

resource "aws_s3_object" "styles" {
  bucket = aws_s3_bucket.website.bucket
  key    = "styles.css"
  source = "./styles.css"
}