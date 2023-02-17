resource "aws_vpc" "task_vpc" {     
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.env}-vpc_main"
  }
} 
# Public and private Subnet

resource "aws_subnet" "public_subnets" {
  count      = length(var.public_subnets)
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = element(var.public_subnets, count.index)
  availability_zone = element(var.Availibity_Zones, count.index)
  tags = {
    Name = "${var.env}-pub_sub_${count.index}"
  }
}



resource "aws_subnet" "private_a" {
  count      = length(var.Availibity_Zones)
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = element(var.private_subnets, count.index)
  availability_zone = element(var.Availibity_Zones, count.index)
  tags = {
    Name = "${var.env}-prv_sub_${count.index}"
  }
}


# Main Internet Gateway for VPC

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.task_vpc.id

  tags = {
    Name = "${var.env}-Internet_IGW"
  }
}

# Elastic IP for NAT Gatewa

resource "aws_eip" "nat_eip"{
    vpc        = true
    depends_on = [aws_internet_gateway.igw]
    tags = {
        Name = "${var.env}-eip"
    }
}


# Main NAT Gateway for VPC with pulic subnet

resource "aws_nat_gateway" "nat"{
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "${var.env}-gw NAT"
  }
}

# Public Route Table for Public Subnet

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.task_vpc.id

  route {
    cidr_block = var.cidr_blocks
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env}-Public Route Table"
  }
}

# Association between Public Subnet and Pulic Route Table

resource "aws_route_table_association" "public_subnets" {
  count          = length(var.Availibity_Zones)
  subnet_id      = aws_subnet.public_subnets.id, [count.index]
  route_table_id = aws_route_table.public.id, [count.index]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.task_vpc.id

  route {
    cidr_block = var.cidr_blocks
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "${var.env}-Private"
  }
}
# Association betwen Private Subnet and Private Route Table

resource "aws_route_table_association" "private_subnets" {
 # count         = length(var.Availibity_Zones)
  subnet_id      = aws_subnet.private_subnets.id [count.index]
  route_table_id = aws_route_table.private_subnet.id [count.index]
}
