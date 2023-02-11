resource "aws_instance" "main" {
  ami           = data.aws_ami.amazon_linux_2.id  # string + hard coded value
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main_sg.id ] # a list of strings
  tags = {
    Name = "${var.env}-instance"
    Name1 = format("%s-instance",var.env)  # result would be =>> dev-instance
  }                         # tags need (map) that shows with ({})
}
