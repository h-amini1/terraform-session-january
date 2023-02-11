terraform {
  backend "s3" {
    bucket = "terraform-session-backend-hassan"
    key    = "session-5/terraform.tfstate" # where does terraform need to store you file. Path or
    region = "us-west-1"
  }
}
