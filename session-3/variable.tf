# Imput Variable
variable "instance_type" {
    type = string
    description = " This is an instance type for EC2 instances"
    default = "t2.micro"
}

vafriable "ami" {
    type = string
    description = "Indecates the enviroment"
    default = "dev"
}