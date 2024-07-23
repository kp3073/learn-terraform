terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
  backend "s3" {
    bucket = "mytestdevops-8c5cd2f3193c3d2f"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

resource "random_id" "buket_id" {
  byte_length = 8
}
resource "aws_s3_bucket" "website_bucket" {
  bucket = "mytestdevops-${random_id.buket_id.hex}"
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  source = "./index.html"
  key    = "index.html"
}

resource "aws_s3_object" "style_css" {
  bucket = aws_s3_bucket.website_bucket.bucket
  source = "./styles.css"
  key    = "styles.css"
}