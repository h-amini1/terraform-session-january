resource "aws_security_group" "main_sg" {   
  name        = "main-sg"
  description = "Allow SSH inbound traffic"
}
resource "aws_security_group_rule" "ingresss" {
  count = 2
  type              = "ingress"
  to_port           = element( var.ports,0 )
  protocol          = "tcp"
  from_port         = element( var.ports,0 )
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