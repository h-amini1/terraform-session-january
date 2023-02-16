#providers-team-env-app-resource-index = naming standard

# aws-cloud-dev-jerry-loadbalancer-0 

# Common Tags:

# 1. Name = aws-cloud-dev-jerry-loadbalancer-0
# 2. Environment = Dev
# 3. Team = Cloud 
# 4. App  = Jerry
# 5. Managed_By = "Terraform, Cloudformation, Python, Manual"
# 6. Owner = "Kris"
variable "env" {
    type = string
    default = "dev"
}
variable "team" {
    type = string
    default = "devops"
}
variable "app" {
    type = string
    default = "shera"
}
variable "index" {
    type = string
    default = "0"
}
variable "manage_by" {
    type = string
    default = "terraform"
}
variable "owner" {
    type = string
    default = "hassan"
}
