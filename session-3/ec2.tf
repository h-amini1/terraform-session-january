resource "aws_instance" "main" {
  ami           = var.ami # string + hard coded value
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main_sg.id ] # a list of strings
  tags = {
    name = var.env 
  }                         # tags need (map) that shows with ({})
}


# What is list? 
# Fruit = [apple, orange, banana]
#car   = [lexus, BMW, Mercedes, Honda]

#types:
#1. Integer
#2. Float
#3. Number = 0, 1, 2, 3,
#4. string = "" # all characters, whatever you see on your keyboard ""
#5. Boolean = true, false


# Reference to resource?
# 1. First labal = aws_security_group 
# 2. Second lable = main_sg
# 3. second_lable = id
# 3. attribute reference 
# How to reference and declear and ID 


# "aws_security_group.main_sg.id" = static or ahrd coded value (String)
# aws_security_group.main_sg.id = reference to resource >> (string, number , boolean)




# Reference to imput variable