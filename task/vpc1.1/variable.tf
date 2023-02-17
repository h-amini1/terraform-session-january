# Variable for Environment
variable "env" {
  type = string
  description = "Variable for Environment"
  default = "dev"
}

variable "cidr_blocks" {
  type = list(string)
  description = "defines CIDR block for all traffic"
  default = ["0.0.0.0/0", "10.0.0.0/16", "10.0.1.0/24", "10.0.2.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}


