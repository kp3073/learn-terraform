resource "null_resource" "sub" {
    provisioner "local-exec" {
      command = "echo ${var.input}"
    }

}

variable "input" {

}