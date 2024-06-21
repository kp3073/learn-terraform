resource "aws_instance" "this" {
  ami = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"
  security_groups = "sg-0411ee85e37f2519a"

  tags = {
    Name = "test-spot"
  }
}


resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.this.private_ip]
}