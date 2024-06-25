resource "null_resource" "locals" {
  provisioner "local-exec" {
    command = "echo hello world ${var.env} Environment"
  }
}


variable "env" {}

terraform {
  backend "s3" {}
}