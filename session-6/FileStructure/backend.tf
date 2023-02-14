terraform {
  backend "s3" {
    bucket = "terraform-session-backend-hassan"
    key    = "session-5/filestructure/dev/terraform.tfstate" # where does terraform need to store you file. Path or
    region = "us-west-1"
    dynamodb_table = "terraform-session-sep-lock" # Lock Table
  }
}

# 1. If you want to isolate infrastructure and resusrce your configuration files, you must isolate the backend
# 2. Isolating backend (terraform.tfstate) = Isolating environment
# 3. backend at the time 
# 4. No variables in key of Backend