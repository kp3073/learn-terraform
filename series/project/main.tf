terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

resource "random_id" "bucket_name" {
  byte_length = 8
}

resource "aws_s3_bucket" "buc" {
  bucket = "bucket-${random_id.bucket_name.hex}"
}