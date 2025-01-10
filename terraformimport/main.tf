terraform {
  required_providers {
	aws = {
	  source  = "hashicorp/aws"
	  version = "5.83.0"
	}
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"


  tags = {
	"Name" = "project-teset-vpc"
  }
  tags_all = {
	"Name" = "project-teset-vpc"
  }

}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.128.0/20"

  tags = {
	Name = "project-teset-subnet-private1-us-east-1a"
  }
}