resource "aws_instance" "this" {
  ami = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"
  vpc_security_group_ids = "sg-0411ee85e37f2519a"

  tags = {
    Name = "test-spot"
  }
}
