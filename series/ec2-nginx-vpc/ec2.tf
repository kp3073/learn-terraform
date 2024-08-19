resource "aws_instance" "nginx" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public-subnet.id
  security_groups = [aws_security_group.nsg.id]

  user_data = <<-EOF

  #!/bin/bash

  dnf update
  dnf install nginx -y
  EOF

  tags = {
    Name = "nginx"
  }
}

output "ip" {
  value = aws_instance.nginx.public_ip
}