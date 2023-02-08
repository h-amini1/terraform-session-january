resource "aws_route_table" "pub_route_table_task" {
  vpc_id = aws_vpc.task_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.task_int_gw.id
  }
  tags = {
    Name = "terra_pub_route_table"
  }
}
