
resource "aws_nat_gateway""homework_nat_gateway"{
    subnet_id = aws_subnet.aws_subnet.pub_sub_b.id
    connectivity_type = "public"
    allocation_id = aws_eip.nat_gateway_eip.id
    tags ={
        Name = "nat_gateway_name"
    }
}