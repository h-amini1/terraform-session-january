#Create a NatGateway in one of the Public Subnet
# https;//registry.terraform.io/prociders/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_nat_gateway""homework_nat_gateway"{
    subnet_id = aws_subnet.public_subnet_name1.id
    connectivity_type = "private"
    #allocation_id = aws_eip.nat_gateway_eip.id
    tags ={
        Name = var.nat_gateway_name
    }
}