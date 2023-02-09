resource "aws_internet_gateway" "task_int_gw" {
  vpc_id = aws_vpc.task_vpc.id

  tags = {
    Name = "terra_internet_gw"
  }
}