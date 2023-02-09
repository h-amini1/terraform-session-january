resource "aws_route_table" "pub_RouteTable" {
  vpc_id = aws_vpc.task_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.task_int_gw.id
  }
  tags = {
    Name = "pub_RouteTable"
  }
}