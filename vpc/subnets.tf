resource "aws_subnet" "pub_sub_a" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-1a"
  tags = {
    Name = "public_sub_a"
  }
}

resource "aws_subnet" "pub_sub_b" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-1b"
  tags = {
    Name = "public_sub_b"
  }
}

resource "aws_subnet" "private_sub_a" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-1a"
  tags = {
    Name = "private_sub_a"
  }
}

resource "aws_subnet" "private_sub_b" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-1b"
  tags = {
    Name = "private_sub_b"
  }
}
# public Subnert with Default