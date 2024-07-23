resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-DevOps-kp3073"
  region = "us-east-1"
}
#
# resource "aws_s3_object" "html" {
#   bucket = "my-tf-test-bucket-DevOps-kp3073"
#   key    = "index.html"
#   source = "./index.html"
# }