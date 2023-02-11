#input variable

variable "sg_name" {
  type = string
  description = "This is asecurity group opens 10 ports"
  default = "main"
}

variable "vpc_id" {
  type = string
  description = "to give vpc id"
  default = "vpc-08d1b3e58f4fb4b4b"
}

variable "cidr_blocks" {
  type = string
  description = "defines CIDR block"
  default = "0.0.0.0/0"
}
variable "protocol" {
  type = string
  description = "specify protocol type"
  default ="tcp"
}
variable "port1" {
  type = string
  description = "giving port numbers"
  default = "22"
}

variable "port2" {
  type = string
  description = "giving port numbers"
  default = "80"
}

variable "port3" {
  type = string
  description = "giving port numbers"
  default = "443"
}
variable "port4" {
  type = string
  description = "giving port numbers"
  default = "100"
}

variable "port5" {
  type = string
  description = "giving port numbers"
  default = "3306"
}
variable "port6" {
  type = string
  description = "giving port numbers"
  default = "3389" 
}

variable "port7" {
  type = string
  description = "giving port numbers"
  default = "5432" 
}

variable "port8" {
  type = string
  description = "giving port numbers"
  default = "888" 
}


variable "port9" {
  type = string
  description = "giving port numbers"
  default = "999" 
}


variable "port10" {
  type = string
  description = "giving port numbers"
  default = "1000" 
}