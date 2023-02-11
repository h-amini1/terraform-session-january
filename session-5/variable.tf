# Imput Variable
variable "instance_type" {
    type = string
    description = " This is an instance type for EC2 instances"
    default = "t2.micro"
}

 variable "env" {
    type = string 
    description = " indictes the enviorment"
    default = "dev"

 }
