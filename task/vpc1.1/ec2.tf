# resource "aws_instance" "main_task" {      
#   ami           = data.aws_ami.amazon_linux_2.id  
#   instance_type = var.instance_type
#   vpc_security_group_ids = [ aws_security_group.main_sg.id ] 
#   associate_public_ip_address = true


#   tags = {
#     Name = "${var.env}-instance" 
#   }                     
# }


