terraform {
  backend "s3" {
    bucket = "terraform-session-backend-hassan"
    key    = "task/vpc1.1/terraform.tfstate" 
    region = "us-west-1"
    dynamodb_table = "terraform-session-sep-lock" 
  }
}

