resource "aws_instance" "main" {
  # count = 3      # 
  ami           = data.aws_ami.amazon_linux_2.id  # string + hard coded value
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main_sg.id ] # a list of strings
  key_name = aws_key_pair.terraform_server.key_name
  provisioner "file" {
    source = "/home/ec2-user/terraform-session-january/session-8/index.html"                # path on Terraform server
    destination = "/tmp/index.html"               #path for the Remote server

    connection {
      type = "ssh"
      user = "ec2-user"      #Remote server user
      host = self.public_ip     # self means all this block
      provate_key = file("~/.ssh/id_rsa")
    }
  }
}
# ssh user@ip it automatically checks public key on 

resource "aws_key_pair" "terraform_server" {
  key_name = "Terraform-Server-key"
  public_key = file("~/.ssh/id_rsa.pub")
}