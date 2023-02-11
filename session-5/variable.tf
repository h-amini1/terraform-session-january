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

variable "ports"{
    type = list(string)
    description = "List of ports"
    default = ["22, 80, 3306"]
}

# element(list)
# count.index = go count the indexes