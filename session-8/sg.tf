resource "aws_security_group" "main_sg" {   
  name        = "main"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"  # string
    cidr_blocks      = ["0.0.0.0/0"] # list of strings
  }
   ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"  # string
    cidr_blocks      = ["0.0.0.0/0"] # list of strings
  }
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # string # All ports and protocols
    cidr_blocks      = ["0.0.0.0/0"] 
  }
}