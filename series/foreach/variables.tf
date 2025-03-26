variable "env" {
  description = "The environment name"
  type        = string
}

variable "vms" {
  description = "A map of virtual machines"
  type = map(object({
	vm_name = string
	vm_size = string
  }))
}