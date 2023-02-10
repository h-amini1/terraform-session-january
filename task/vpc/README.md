How to create vpc?
- Define AWS Provider. 

provider "aws" {
region = "us-west-1"  
}

- Define VPC resource >> registry.terraform.io/providers/hashicorp/aws/latest/docs/resource/vpc
- Argument Reference
- 1. cidr_block (required)
- 2. most of the Argument is optional depence on your code

#Create 2 public subnets in the 2 AZ

resource "aws_subnet" "public_subnet_name1"{
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.1.0/24"
    tags ={
        Name = "public_subnet_name_1"
    }
}



Error.
1. No configuration file to be persent

How to create private subnet and subnet?
Hot to use terraform open source module to do same thing in the source.


1. 