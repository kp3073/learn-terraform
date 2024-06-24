terraform {
  backend "s3" {
    bucket = "terraform-d75"
    key    = "terraform-series/terrraform.tfstate"
    region = "us-east-1"
  }
}


resource "null_resource" "name" {
  resource "local-exec"{
    command = "echo Hello World"
  }
}