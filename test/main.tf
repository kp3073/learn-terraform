
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "env-vpc"
  }
}


resource "aws_vpc_peering_connection" "foo" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = var.vpc_id
  vpc_id        = aws_vpc.main.id
  auto_accept = true
}






