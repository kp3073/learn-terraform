resource "aws_s3_bucket" "bucket" {
  bucket = "mytestdevops819274987249732974937"
}

resource "aws_s3_object" "file" {
  bucket = aws_s3_bucket.bucket.bucket
  source = "./terraform.tfstate"
  key    = "terraform.tfstate"
}