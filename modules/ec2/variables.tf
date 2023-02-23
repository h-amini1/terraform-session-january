variable "env" {
    type = string
    default = "This varible is for environment"
}

variable "ami" {
  type = string
  default = ""
  description = "AMI for ec2 Instance"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "Instance size"
}

variable "sg" {
  type = list(string)
  default = [""]
  description = "list of security group ids"
}