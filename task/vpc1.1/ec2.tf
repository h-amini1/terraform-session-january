resource "aws_instance" "main_task" {
  count = 3      
  ami           = data.aws_ami.amazon_linux_2.id  
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main_sg.id ] 
  tags = {
    Name = "${var.env}-instance"                      
}


