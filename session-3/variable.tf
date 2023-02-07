# Imput Variable
variable "instance_type" {
    type = string
    description = " This is an instance type for EC2 instances"
    default = "t2.micro"
}

variable "ami" {
    type = string
    description = "Indecates the enviroment"
    default = "dev"
}
 variable "env" {
    type = string 
    description = " indictes the enviorment"
    default = "dev"

 }