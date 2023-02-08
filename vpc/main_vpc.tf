provider "aws" {
region = "us-west-1"  
}
resource "aws_vpc" "main_vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "main_vpc VPC"
  }
}







# Define AWS Provider. 
# Define VPC resource >> registry.terraform.io/providers/hashicorp/aws/latest/docs/resource/vpc
# Argument Reference
# 1. cidr_block (required)
# 2. most of the Argument is optional depence on your code