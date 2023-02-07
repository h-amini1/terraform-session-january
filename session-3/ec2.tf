resource "aws_instance" "main" {
  ami           = "ami-0036b4598ccd42565"
  instance_type = "t2.micro"
}