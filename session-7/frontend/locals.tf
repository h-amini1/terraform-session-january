locals {
  name = "aws-${var.region}-${var.stage}-${var.env}-${var.project}-rtype"
  common_tags = {
    env        = var.env
    project    = var.project
    team       = "DevOps"
    owner      = "hassan"
    managed_by = "terraform"
  }
}