terraform {
  backend "s3" {
    bucket = "terraform-session-backend-hassan"
    key    = "session-5/terraform.tfstate" # where does terraform need to store you file. Path or
    region = "us-west-1"
    dynamodb_table = "terraform-session-sep-lock" # Lock Table
  }
}

# 1. You cannot usee any variables in key
# 2. 