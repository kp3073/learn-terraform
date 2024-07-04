module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  peer_owner_id = var.peer_owner_id
  default_vpc_id = var.default_vpc_id
}

