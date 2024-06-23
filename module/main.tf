module "name" {
  source = "./local-module"
  input = var.input
}

variable "input" {
  default = "hello Universe"
}