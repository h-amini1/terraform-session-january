resource "aws_security_group" "main" {   
  name        = "main-sg"
  description = "Allow SSH inbound traffic"
}
resource "aws_security_group_rule" "ingresss" {
  count = length( var.ports )
  type              = "ingress"
  to_port           = element( var.ports, count.index )
  protocol          = "tcp"
  from_port         = element( var.ports, count.index )
  security_group_id = aws_security_group.main_sg.id
  cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.main_sg.id
  cidr_blocks = ["0.0.0.0/0"]
}