
terraform {
  backend "s3" {
    bucket = "terraform-session-backend-hassan"
    key    = "session-7/terraform.tfstate" # where does terraform need to store you file. Path or prefix
    region = "us-west-1"
    dynamodb_table = "terraform-session-sep-lock" # Lock Table
  }
}

