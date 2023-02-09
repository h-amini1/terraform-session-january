resource "aws_nat_gateway" "task_nat_gw" {
  allocation_id = aws_eip.vpc_eip.allocation_id
  subnet_id     = aws_subnet.aws_subnet.pub_sub_b.id

  tags = {
    Name = "terra_nat_gw"
  }

}