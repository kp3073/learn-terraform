variable "env" {}


variable "vms" {
  vm-test1 = {
	name    = "mysql"
	vm_size = "Standard_DS1_v2"
  }
  vm-test2 = {
	name    = "mongodb"
	vm_size = "Standard_DS1_v2"
  }
}