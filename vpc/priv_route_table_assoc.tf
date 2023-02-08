resource "aws_route_table_association" "priv_a" {
  subnet_id      = aws_subnet.priv_sub_a.id
  route_table_id = aws_route_table.priv_route_table_task.id
}

resource "aws_route_table_association" "priv_b" {
  subnet_id      = aws_subnet.priv_sub_b.id
  route_table_id = aws_route_table.priv_route_table_task.id
}

resource "aws_route_table_association" "priv_c" {
  subnet_id      = aws_subnet.priv_sub_c.id
  route_table_id = aws_route_table.priv_route_table_task.id
}