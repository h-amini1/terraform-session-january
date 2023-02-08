resource "aws_subnet" "pub_sub_a" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public_sub_a"
  }
}

resource "aws_subnet" "pub_sub_b" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public_sub_b"
  }
}

resource "aws_subnet" "pub_sub_c" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "public_sub_c"
  }
}