#Create VPC
resource "aws_vpc""main" {
  cidr_block = "10.0.0.0/16"
  tags = {
      Name = "Main VPC"

  }
}
# Public Subnet with Default Route to Internet Gateway
# https://registry.terrafrom.io/providers/hashicorp/aws/latest/docs/resources/subnet

# resource "aws_subnet" "public_subnet_name1" {
#     vpc_id = aws_vpc.main.id
#     cidr_block = "10.0.1.0/24"
#     tags ={
#         Name = "public_subnet_name_1"
#     }
# }

# resource "aws_subnet" "public_subnet_name2" {
#     vpc_id = aws_vpc.main_vpc.id
#     availability_zone = var.availibility_zone_2
#     cidr_block = "10.0.2.0/24"
#     tags ={
#         Name = "public_subnet_name_2"
#     }
# }


# # Private Subnet with Default Route to NAT Gateway
# # https://registry.terrafrom.io/providers/hashicorp/aws/latest/docs/resources/subnet


# resource "aws_subnet" "private_subnet_name1" {
#     cidr_block = "10.0.11.0/24"
#     tags ={
#         Name = "private_subnet_name_1"
#     }
# }

# resource "aws_subnet" "private_subnet_name2" {
#     vpc_id = aws_vpc.main.id
#     availability_zone = var.availibility_zone_2
#     cidr_block = "10.0.12.0/24"
#     tags ={
#         Name = "private_subnet_name_2"
#     }
# }

# min Internal Gateway for VPC
# https;//registry.terraform.io/prociders/hashicorp/aws/latest/docs/resources/internet_gateway







# Define AWS Provider. 
# Define VPC resource >> registry.terraform.io/providers/hashicorp/aws/latest/docs/resource/vpc
# Argument Reference
# 1. cidr_block (required)
# 2. most of the Argument is optional depence on your code