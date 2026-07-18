resource "aws_sqs_queue" "email_dlq" {

  name = "${var.project_name}-dlq"

  message_retention_seconds = 1209600

  tags = {
    Project = var.project_name
    Managed = "Terraform"
  }
}

resource "aws_sqs_queue" "email_queue" {

  name = "${var.project_name}-queue"

  visibility_timeout_seconds = 60

  message_retention_seconds = 345600

  delay_seconds = 0

  receive_wait_time_seconds = 10

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.email_dlq.arn
    maxReceiveCount     = 5
  })

  tags = {
    Project = var.project_name
    Managed = "Terraform"
  }
}