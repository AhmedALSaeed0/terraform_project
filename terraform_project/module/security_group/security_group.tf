#secrity_group
resource "aws_security_group" "allow_tls" {
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.cloud_vpc.id

  tags = {
    Name = "allow_tls"
  }
}
#secrity_group_ingress_rule
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.inbound
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
#secrity_group_egress_rule
resource "aws_vpc_security_group_egress_rule" "cloud_secrity_group" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.outbound
  ip_protocol       = "-1" # semantically equivalent to all ports
}