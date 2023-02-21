resource "aws_instance" "main" {
  # count = 3      # 
  ami           = data.aws_ami.amazon_linux_2.id  # string + hard coded value
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main_sg.id ] # a list of strings
  key_name = aws_key_pair.terraform_server.key_name
}

resource "aws_key_pair" "terraform_server" {
  key_name = "Terraform-Server-key"
  public_key = flie("~/.ssh/id_rsa.pub")
}