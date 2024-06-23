resource "null_resource" "subw" {
    provisioner "local-exec" {
      command = "echo ${var.input}"
    }

}

variable "input" {

}