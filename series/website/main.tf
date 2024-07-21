terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
  backend "s3" {
    bucket = "mytestdevops-8c5cd2f3193c3d2f"
    key = "backend.tfstate"
    region = "us-east-1"
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