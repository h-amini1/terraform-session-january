# terraform modules 
# 1. chils module = declear the resources
# 2. Root module = call the child module, run terraofrm commands


# local Module = module is in your filesystem 
# Remote Module + SCM, HTTP URL, Terraform Cloud  ro enterprise private registeries


module "ec2_instance" {
  source = "../../modules/ec2"     # where the child module is 
  ################### Variables #################
  env = "dev"
  ami = "ami-0036b4598ccd42565"
  instinstance_type = "t2.micro"
}