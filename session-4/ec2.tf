resource "aws_instance" "main" {
  ami           = data.aws_ami.amazon_linux_2.id  # string + hard coded value
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main_sg.id ] # a list of strings
  tags = {
    Name = "${var.env}-instance"
  }                         # tags need (map) that shows with ({})
}

# dev-instance
# qu-instance
# stage-instance
# prod-instance

resource "aws_instance" "main_function" {
  ami           = data.aws_ami.amazon_linux_2.id  # string + hard coded value
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main_sg.id ] # a list of strings
  tags = {
    Name = "${var.env}-frontend-instance"
  }                         # tags need (map) that shows with ({})
}

# variable + hardcoded value
# var.env  + -instance  

# dev-frontend-instance
# qu-frontend-instance
# stage-frontend-instance
# prod-frontend-instance



# Refernces:

# 1. resource
# 2. Imput Variable
# 3. Data source