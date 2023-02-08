resource "aws_internet_gateway" "Internet-gw" {
  vpc_id = vpc-04a7a3a1cb5b9d528.id
}

resource "aws_instance" "foo" {
  # ... other arguments ...

  depends_on = [aws_internet_gateway.Internet-gw]
}