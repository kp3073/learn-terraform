
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
resource "aws_subnet" "private" {
  count = length(var.privet_subnet)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet[count.index]

  tags = {
    Name = "privet_subent-${count.index + 1}"
  }
}


resource "aws_subnet" "public" {
  count = length(var.public_subnet)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet[count.index]

  tags = {
    Name = "privet_subent-${count.index + 1}"
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
    Name = "privateRT"
  }
}


resource "aws_route_table_association" "a" {
  count = length(var.public_subnet)
  subnet_id      = var.public_subnet[count.index].id
  route_table_id = aws_route_table.privateRT.id
}




