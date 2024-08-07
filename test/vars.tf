variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "peer_owner_id" {
  default = "471112727668"
}

variable "vpc_id" {
  default = "vpc-01c37a20026cef1d0"
}

variable "privet_subnet" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "public_subnet" {
  default = ["10.0.3.0/24","10.0.4.0/24"]
}