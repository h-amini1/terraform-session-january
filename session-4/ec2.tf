resource "aws_instance" "main" {
  ami           = var.ami # string + hard coded value
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main_sg.id ] # a list of strings
  tags = {
    name = var.env 
  }                         # tags need (map) that shows with ({})
}


# Refernces:

# 1. resource
# 2. Imput Variable
# 3. Data source