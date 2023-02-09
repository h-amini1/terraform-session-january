resource "aws_internet_gateway" "Internet-gw" {
  vpc_id = aws_vpc.task_vpc.id
}

    tags = {
    Name = "task_ig"

}