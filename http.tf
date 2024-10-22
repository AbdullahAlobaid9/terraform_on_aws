resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private-b.id
  associate_public_ip_address = false
  availability_zone = "${var.region}a"
  key_name    = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.http.id]
  tags = {
    Name = "Private-server -terraform"
  }
}

output "web_private_ip" {
  value = aws_instance.web.private_ip
}