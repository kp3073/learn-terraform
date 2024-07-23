resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-DevOps-kp3073"
  region = "us-east-1"
}
#
resource "aws_s3_object" "html" {
  bucket = aws_s3_bucket.example.bucket
  key    = "index.html"
  source = "./index.html"
}

resource "aws_s3_object" "styles" {
  bucket = aws_s3_bucket.example.bucket
  key    = "styles.css"
  source = "./styles.css"
}