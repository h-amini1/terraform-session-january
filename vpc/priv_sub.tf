resource "aws_subnet" "priv_sub_a" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private_sub_a"
  }
}

resource "aws_subnet" "priv_sub_b" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.12.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private_sub_b"
  }
}

resource "aws_subnet" "priv_sub_c" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.13.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "private_sub_c"
  }
}