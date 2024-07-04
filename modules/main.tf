module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  peer_owner_id = var.account_no
  default_vpc_id = var.default_vpc_id
}

