terraform {
  backend "s3" {
    bucket = "terraform-session-backend-hassan"
    key    = "terraform.tfstate" # where does terraform need to store you file. Path or prefix
    region = "us-west-1"
    dynamodb_table = "terraform-session-sep-lock" # Lock Table
    workspace_key_prefix = "session-11"
  }
}


# Currently: default
# Backend File Path: session-11/terraform.tfstate
# Switch: dev
# Backend File Path: session-11/dev/terraform.tfstate

# When you use Terrafomr workspace_key_prefix
# It creates a terraform.tfstate in a following path


# workspace_key_prefix/key