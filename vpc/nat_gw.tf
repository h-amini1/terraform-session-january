resource "aws_nat_gateway" "task_nat_gw" {
  allocation_id = aws_eip.vpc_eip.allocation_id
  subnet_id     = aws_subnet.pub_sub_a.id

  tags = {
    Name = "terra_nat_gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # /|\on the Internet Gateway for the VPC.
  # This affects the order in which Terraform processes all the resources and data sources
  # /|\ associated with that module
  depends_on = [aws_internet_gateway.task_int_gw]
}