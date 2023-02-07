resource "aws_instance" "main" {
  ami           = "ami-0036b4598ccd42565"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["aws_security_group.main_sg.id"] # a list of strings
}


# What is list? 
# Fruit = [apple, orange, banana]
#car   = [lexus, BMW, Mercedes, Honda]

#types:
#1. Integer
#2. Float
#3. Number = 0.1.2.3.
#4. string = "" # all characters, whatever you see on your keyboard ""
#5. Boolean = true, false


# Reference to resource?
# 1. First labal, 
# 2. Second lable
# 3, 
# How to reference and declear and ID 