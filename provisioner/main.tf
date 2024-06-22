resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}

resource "null_resource" "test2" {
  provisioner "local-exec" {
    command = <<EOF
    pwd
    ls
    echo hello world
    EOF
  }
}