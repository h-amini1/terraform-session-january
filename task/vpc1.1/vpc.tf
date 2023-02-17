resource "aws_vpc" "task_vpc" { 
  count = 1  
  cidr_block       = element( var.cidr_blocks, count.index )
  instance_tenancy = "default"

  tags = {
    "Name" = "${var.env}-main_vpc"
  }
} 

# Main Internet Gateway for VPC

resource "aws_internet_gateway" "igw" {
  vpc_id = [aws_vpc.task_vpc.id, count.index]

  tags = {
    Name = "${var.env}-Internet_IGW"
  }
}

# Public Subnets
resource "aws_subnet" "public_a" {
  count = 2
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = element( var.cidr_blocks, count.index ) 
  availability_zone = data.aws_availability_zones.available_zones.name[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-pub-sub-a"
  }
}

resource "aws_subnet" "public_b" {
  count = 3
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = element( var.cidr_blocks, count.index )
  availability_zone = data.aws_availability_zones.available_zones.name[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-pub-sub-b"
  }
}

# Route Table for Public Subnet

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.task_vpc.id

  route {
    count = 0
    cidr_block = element( var.cidr_blocks, count.index )     # Destination is anywhere
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env}-Public Route Table"
  }
}


# Create private subnet
resource "aws_subnet" "private_a" {
  count = 4
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = element( var.cidr_blocks, count.index )
  availability_zone =  data.aws_availability_zones.available_zones.name[0]
  tags = {
    Name = "${var.env}-prv-sub-a"
  }
}

resource "aws_subnet" "private_b" {
  count = 5
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = element( var.cidr_blocks, count.index )
  availability_zone = data.aws_availability_zones.available_zones.name[1]
  map_public_ip_on_launch = false      # No public IP address
  tags = {
    Name = "${var.env}-prv-sub-b"
  }
}

# Elastic IP for NAT Gateway

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
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "${var.env}-gw NAT"
  }
}


# Association between Public Subnet and Pulic Route Table

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.task_vpc.id

  route {
    count = 0
    cidr_block = element( var.cidr_blocks, count.index )
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "${var.env}-private"
  }
}


# Association betwen Private Subnet and Private Route Table

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}