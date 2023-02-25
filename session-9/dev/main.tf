/* Terraform Modules
1. Child Module = declare the resources
2. Root Module  = call the child module, run Terraform commands

Local Module = module is in yoru filesystem
Remote Module = SCM, HTTP URL, Terraform Cloud or Enterprise Private Registeries */

module "ec2_instance" {
    source = "../../modules/ec2" # Where the child module is
######################## Variables ########################
    env = "dev"
    ami = "ami-0036b4598ccd42565"
    instance_type = "t2.micro"
    sg = [module.ec2_sg.main_sg_id]  # Module.Module_Name.Attribute
}

module "ec2_sg" {
    source = "../../modules/sg"
    env = "dev"
}

# How to Reference to Child Module?

# You always reference to Child Module outputs

# Module.Module_Name.Output_Name
