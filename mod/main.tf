module "subw" {
  source = "./sub"
  input = var.input
}


variable "input" {
  default = "Hello Oreo"
}