# variable for DIDR block and name tag's for VPC
variable "vpc_cidr-16" {
  type = string
  description = "defines CIDR block"
  default = "10.0.0.0/16"
}
variable "vpc-main" {
  type = string
  description = "give var for vpc"
  default = "task_vpc"
}

# variables for CIDR, AZ and tag in public Subnet

variable "vpc_cidr-1a" {
  type = string
  description = "defines CIDR block"
  default = "10.0.1.0/24"
}
variable "zone_a" {
  type = string
  description = "Defines Availibity Zone"
  default = "us-west-1a" 
}
variable "pub-sub-a" {
  type = string
  description = "name tag for sub a"
  default = "public_sub_a"
}

#...............................

variable "vpc_cidr-1b" {
  type = string
  description = "defines CIDR block"
  default = "10.0.2.0/24"
}
variable "zone_b" {
  type = string
  description = "Defines Availibity Zone"
  default = "us-west-1b" 
}
variable "pub-sub-b" {
  type = string
  description = "name tag for sub b"
  default = "public_sub_b"
}

# variables for CIDR, AZ and tag in private Subnet

variable "cidr-prv-a" {
  type = string
  description = "defines CIDR block for private sub"
  default = "10.0.11.0/24"
}

variable "prv-sub-a" {
  type = string
  description = "name tag for sub b"
  default = "private_sub_a"
}

#..........................................
variable "cidr-prv-b" {
  type = string
  description = "defines CIDR block"
  default = "10.0.12.0/24"
}

variable "prv-sub-b" {
  type = string
  description = "name tag for sub b"
  default = "prv_sub_b"
}

# variables CIDR blocks for all traffic

variable "cidr_blocks" {
  type = string
  description = "defines CIDR block for all traffic"
  default = "0.0.0.0/0"
}

# tag name Internet Gateway

variable "IGW" {
  type = string
  description = "tag name for igw"
  default = "Internet_IGW"
}

# var Elastic IP Tag name
variable "eip" {
  type = string
  description = "tag name for eip"
  default = "eip"
}
