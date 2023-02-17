# Variable for Environment
variable "env" {
  type = string
  description = "Variable for Environment"
  default = "dev"
}

variable "cidr_blocks" {
  type = string
  description = "defines CIDR block for all traffic"
  default = "0.0.0.0/0"
}

variable "cidr_block_vpc" {
  type = string
  description = "defines CIDR block for vpc"
  default = "0.0.0.0/16"
}
variable "cidr_blocks_list" {
  type = list(string)
  description = "defines CIDR block for all traffic"
  default = ["10.0.0.0/16", "10.0.1.0/24", "10.0.2.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}

variable "ports"{
    type = list(string)
    description = "List of ports"
    default = ["22, 80, 3306"]
}

# Imput Variable
variable "instance_type" {
    type = string
    description = " This is an instance type for EC2 instances"
    default = "t2.micro"
}