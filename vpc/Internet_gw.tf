resource "aws_internet_gateway" "Internet-gw" {
  vpc_id = aws_vpc.task_vpc.id
}

resource "aws_instance" "foo" {
  # ... other arguments ...

  depends_on = [aws_internet_gateway.Internet-gw]
}