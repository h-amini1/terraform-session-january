module "ec2_instance" {
    source = "github.com/h-amini1/terraform-session-january/main/modules/ec2" 
    env = "dev"
    ami = "ami-0036b4598ccd42565"
    instance_type = "t2.micro"
}
