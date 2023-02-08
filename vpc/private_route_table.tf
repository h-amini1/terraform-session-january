resource "aws_route_table" "priv_route_table_task" {
  vpc_id = aws_vpc.task_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.task_nat_gw.id
  }
  tags = {
    Name = "terra_priv_route_table"
  }
}