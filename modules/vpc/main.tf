resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "env-vpc"
  }

  resource "aws_vpc_peering_connection" "peering" {
    peer_owner_id = var.account_no
    peer_vpc_id   = var.default_vpc_id
    vpc_id        = aws_vpc.main.id
    auto_accept = "true"
  }