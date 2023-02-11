   
resource "aws_security_group" "main_sg" {
  name        = var.sg_name
  description = "This security group allows inbound traffic for 10 ports"
  vpc_id = var.vpc_id

  ingress   {
    description      = "Allow ${var.port1} from VPC"
    from_port        = var.port1
    to_port          = var.port1
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_blocks]
  } 
  ingress   {
    description      = "Allow ${var.port2} from VPC"
    from_port        = var.port2
    to_port          = var.port2
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_blocks]
  } 
    ingress   {
    description      = "Allow ${var.port3} from VPC"
    from_port        = var.port3
    to_port          = var.port3
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_blocks]
  } 

    ingress   {
    description      = "Allow ${var.port4} from VPC"
    from_port        = var.port4
    to_port          = var.port4
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_blocks]
  } 

    ingress   {
    description      = "Allow ${var.port5} from VPC"
    from_port        = var.port5
    to_port          = var.port5
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_blocks]
  } 

    ingress   {
    description      = "Allow ${var.port6} from VPC"
    from_port        = var.port6
    to_port          = var.port6
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_blocks]
  } 
    ingress   {
    description      = "Allow ${var.port7} from VPC"
    from_port        = var.port7
    to_port          = var.port7
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_blocks]
  } 
    ingress   {
    description      = "Allow ${var.port8} from VPC"
    from_port        = var.port8
    to_port          = var.port8
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_blocks]
  } 

      ingress   {
    description      = "Allow ${var.port9} from VPC"
    from_port        = var.port9
    to_port          = var.port9
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_blocks]
  } 

      ingress   {
    description      = "Allow ${var.port10} from VPC"
    from_port        = var.port10
    to_port          = var.port10
    protocol         = var.protocol
    cidr_blocks      = [var.cidr_blocks]
  } 

  egress   {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.cidr_blocks]
  }
}