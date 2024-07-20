
resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket"
  region = "us-east-1"
}