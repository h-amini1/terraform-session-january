resource "aws_eip" "vpc_eip" {
  vpc      = true
  public_ipv4_pool = "amazon"
}