terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

resource "random_id" "buket_id" {
  byte_length = 8
}
resource "aws_s3_bucket" "bucket" {
  bucket = "mytestdevops-${random_id.buket_id.hex}"
}

resource "aws_s3_object" "file" {
  bucket = aws_s3_bucket.bucket.bucket
  source = "./terraform.tfstate"
  key    = "terraform.tfstate"
}