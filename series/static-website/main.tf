resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-DevOps"
}

resource "aws_s3_object" "html" {
  bucket = "my-tf-test-bucket-DevOps"
  key    = "new_object_key"
  source = "path/to/file"
}