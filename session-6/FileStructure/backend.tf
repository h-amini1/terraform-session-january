terraform {
    backend "s3" {
        bucket = "terraform-session-september-backend-hassan"
        reguin = "us-west-1"
        key = "session-6/FileStructure/dev/terrraform.tfstate"
        dynamodb_table = "terraform-session-sep-state-lock"
    }
}