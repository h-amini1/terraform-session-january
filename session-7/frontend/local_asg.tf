resource "aws_security_group" "lc_sg" {
  name        = replace(local.name , "resource","securitygroup")
  description = "This security group is for lc"
  tags = local.common_tags
}

resource "aws_security_group_rule" "ingress" {
  count = length(var.ports)
  type              = "ingress"
  to_port           = element(var.ports , count.index) 
  from_port         = element(var.ports , count.index)
  cidr_blocks = [ var.cidr_block_all ]
  security_group_id = aws_security_group.lc_sg.id
  protocol          = var.protocol
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.lc_sg.id
  cidr_blocks = [ var.cidr_block_all ]
}