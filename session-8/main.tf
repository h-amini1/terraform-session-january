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
      private_key = file("~/.ssh/id_rsa")
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
  }
   connection {
      type = "ssh"
      user = "ec2-user"      #Remote server user
      host = self.public_ip     # self means all this block
      private_key = file("~/.ssh/id_rsa")
    }
}
# ssh user@ip it automatically checks public key on the remote machine, 

resource "aws_key_pair" "terraform_server" {
  key_name = "Terraform-Server-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
output "instance_ip" {
  value = aws_instance.main.public_ip
}

resource "null_resource" "local_script" {
  provisioner "local-exec" {
command = "echo 'hello from the local server' >> local.txt"
  }
}