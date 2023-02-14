resource "aws_sqs_queue" "main" {
    name = "${var.env}-sqs"
    tags = {
        enviorment = var.env
        Name = format("%s-sqs", var.env)  # dev-sqs, qa-sqs, stage-sqs, prod-sqs
        Name1 = "${var.env}-sqs-new"
    }     
}