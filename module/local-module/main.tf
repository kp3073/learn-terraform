resource "null_resource" "name" {
  provisioner "local-exec" {
    command = "echo hello world"
    command =  ${var.input}
  }
}

variable "input" {}