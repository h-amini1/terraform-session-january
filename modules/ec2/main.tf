resource "aws_instance" "main" {
  ami           = data.aws_ami.amazon_linux_2.id  
  instance_type = var.instance_type

  tags = {
    Name = "${var.env}-instance"
  }                         
}