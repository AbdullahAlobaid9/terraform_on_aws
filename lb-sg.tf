
resource "aws_security_group" "lb-sg" {
  name        = "lb-sg"
  description = "lb-sg"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "lb-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_lb_ssh" {
  security_group_id = aws_security_group.lb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_lb_trafic" {
  security_group_id = aws_security_group.lb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_eip" "lb-ip" {
  domain   = "vpc"
}