resource "aws_sqs_queue" "main" {
  name = "${terraform.wokspace}-sqs"
}

# terraform.workspace = workspace name