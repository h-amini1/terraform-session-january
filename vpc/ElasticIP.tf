
resource "aws_eip""nat_gateway_eip"{
    vpc = true
    tags = {
        Name = "eip"
    }
}
#----Allocate Elastic IP Address------
#------ Terraform allow elastic ip