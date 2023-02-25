variable "env" {
    type = string
    default = "dev"
    description = "This variable is for enviornment"
}

variable "ami" {
    type = string
    default = ""
    description = "AMI for EC2 Instance"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "Instance size"
}

variable "sg" {
    type = list(string)
    default = [""]
    description = "List of security group ids"
}