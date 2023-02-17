# Variable for Environment
variable "env" {
  type = string
  description = "Variable for Environment"
  default = "dev"
}

#Variable for Instance_type
variable "instance_type" {
  type        = string
  description = "This is a variable for instance type"
  default     = "t2.micro"
}

# CIDRs for public subnet
variable "public_subnets" {
  type        = list(string)
  description = "This is the ciders for the public subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# List of AZs
variable "Availibity_Zones" {
  type        = list(string)
  description = "These are the list of the AZs for the subnets"
  default     = ["us-west-1a", "us-west-1b"]
}

# A list of Subnet names
variable "name" {
  type        = list(string)
  description = "this is the names of the public subnets"
  default     = ["pub_sub_a", "pub_sub_b"]
}
variable "private_subnets" {
  type        = list(string)
  description = "This is the ciders for the private subnet"
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}
variable "private_subnet_name" {
  type        = list(string)
  description = "this is the names of the private subnets"
  default     = ["prv_sub_a", "prv_sub_b"]
}


# variable for DIDR block and name tag's for VPC
variable "vpc_cidr" {
  type = string
  description = "defines CIDR block"
  default = "10.0.0.0/16"
}



# variables CIDR blocks for all traffic

variable "cidr_blocks" {
  type = string
  description = "defines CIDR block for all traffic"
  default = "0.0.0.0/0"
}

variable "ports"{
    type = list(string)
    description = "List of ports"
    default = ["22, 80, 3306"]
}
