resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My-VPC"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Private-Subnet"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "Public-Subnet"
  }
}


resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "My-Internet-Gateway"
  }
}

resource "aws_route_table" "myrt" {
        vpc_id = aws_vpc.my-vpc.id

        route {
            cidr_block = "0.0.0.0/0"
            gateway_id = aws_internet_gateway.internet-gateway.id
        }

        tags = {
        Name = "My-Route-Table"
        }
}

resource "aws_route_table_association" "public-subnet-association" {
        subnet_id      = aws_subnet.public-subnet.id
        route_table_id = aws_route_table.myrt.id
}
