resource "aws_route_table_association" "pub_a" {
  subnet_id      = aws_subnet.pub_sub_a.id
  route_table_id = aws_route_table.pub_route_table_task.id
}

resource "aws_route_table_association" "pub_b" {
  subnet_id      = aws_subnet.pub_sub_b.id
  route_table_id = aws_route_table.pub_route_table_task.id
}

resource "aws_route_table_association" "pub_c" {
  subnet_id      = aws_subnet.pub_sub_c.id
  route_table_id = aws_route_table.pub_route_table_task.id
}