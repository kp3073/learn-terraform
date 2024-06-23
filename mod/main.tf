module "sub" {
  source = "./sub"
  input = var.input
}


variable "input" {
  default = "Hello Oreo"
}