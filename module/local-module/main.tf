resource "null_resource" "name" {
    provisioner "local-exec" {

    command =  "echo ${var.input}"
  }
}

variable "input" {}