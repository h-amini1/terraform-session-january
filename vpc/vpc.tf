resource "aws_vpc" "task_vpc" {     
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "terraform_vpc"
  }
} 
# Public and private Subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-1a"
  tags = {
    Name = "public_sub_a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-1b"
  tags = {
    Name = "public_sub_b"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-west-1a"
  tags = {
    Name = "private_sub_a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.12.0/24"
  availability_zone = "us-west-1b"
  tags = {
    Name = "private_sub_b"
  }
}

# Main Internet Gateway for VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gatway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.task_vpc.id

  tags = {
    Name = "Internet_IGW"
  }
}

# Elastic IP for NAT Gatewa
# https://registry.terraform.io/provdiers/hashicorp/aws/latest/docs/resources/eip
# Allocate Elastic IP Address
# Terraform allow elastic ip

resource "aws_eip""nat_gateway_eip"{
    vpc        = true
    depends_on = [aws_internet_gateway.igw]
    tags = {
        Name = "eip"
    }
}


# Main NAT Gateway for VPC with pulic subnet
# https://registry.terraform.io/provdiers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.allocation_id
  subnet_id     = aws_subnet.public_sub_a.id

  tags = {
    Name = "task ngw"
  }

}

# # Route Table for Public Subnet
# # https://registry.terraform.io/provdiers/hashicorp/aws/latest/docs/resources/route_table

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.task_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "Public Route Table"
#   }
# }

# # Association between Pulicc Subnet and Pulic Route Table
# # https://registry.terraform.io/provdiers/hashicorp/aws/latest/docs/resources/route_table_association

# resource "aws_route_table_association" "public_a" {
#   subnet_id      = aws_subnet.pulic_a.id
#   route_table_id = aws_route_table.public.id
# }
# resource "aws_route_table_association" "public_b" {
#   subnet_id      = aws_subnet.pulic_b.id
#   route_table_id = aws_route_table.public.id
# }

# # Association betwen Private Subnet and Private Route Table
# # https://registry.terraform.io/provdiers/hashicorp/aws/latest/docs/resources/route_table_association

# resource "aws_route_table_association" "private_a" {
#   subnet_id      = aws_subnet.private_a.id
#   route_table_id = aws_route_table.private.id
# }
# resource "aws_route_table_association" "private_b" {
#   subnet_id      = aws_subnet.private_b.id
#   route_table_id = aws_route_table.private.id
# }