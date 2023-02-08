resource "aws_nat_gateway" "task_ngw" {
  allocation_id = aws_eip.eip.allocationid # Asking for Elastic IP
  subnet_id     = aws_subnet.pub_sub_b.id

  tags = {
    Name = "NATgw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}