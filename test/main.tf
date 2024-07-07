
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
resource "aws_subnet" "main" {
  count = length(var.privet_subent)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.privet_subent[count.index]

  tags = {
    Name = "privet_subent-${count.index}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}


resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "example"
  }
}





