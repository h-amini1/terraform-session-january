resource "aws_vpc" "task_vpc" {     
  cidr_block       = var.vpc_cidr/16
  tags = {
    Name = var.vpc-main
  }
} 
# Public and private Subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = var.vpc_cidr-1a 
  availability_zone = var.zone_a
  tags = {
    Name = var.pub-sub-a
  }
}



resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = var.vpc_cidr-1b
  availability_zone = var.zone_b
  tags = {
    Name = var.pub-sub-b
  }
}

resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = var.cidr-prv-a
  availability_zone = var.zone_a
  tags = {
    Name = var.prv-sub-a
  }
}

resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = var.cidr-prv-b
  availability_zone = var.zone_b
  tags = {
    Name = var.prv-sub-b
  }
}

# Main Internet Gateway for VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gatway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.task_vpc.id

  tags = {
    Name = var.IGW
  }
}

# Elastic IP for NAT Gatewa
# https://registry.terraform.io/provdiers/hashicorp/aws/latest/docs/resources/eip
# Allocate Elastic IP Address
# Terraform allow elastic ip

resource "aws_eip" "nat_eip"{
    vpc        = true
    depends_on = [aws_internet_gateway.igw]
    tags = {
        Name = var.eip
    }
}


# Main NAT Gateway for VPC with pulic subnet
# https://registry.terraform.io/provdiers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "nat"{
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "gw NAT"
  }
}

# Route Table for Public Subnet
# https://registry.terraform.io/provdiers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.task_vpc.id

  route {
    cidr_block = var.cidr_blocks
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Association between Public Subnet and Pulic Route Table
# https://registry.terraform.io/provdiers/hashicorp/aws/latest/docs/resources/route_table_association

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
    cidr_block = var.cidr_blocks
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "Private"
  }
}
# Association betwen Private Subnet and Private Route Table
# https://registry.terraform.io/provdiers/hashicorp/aws/latest/docs/resources/route_table_association

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}