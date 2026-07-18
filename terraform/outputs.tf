output "queue_url" {
  value = aws_sqs_queue.email_queue.url
}

output "queue_arn" {
  value = aws_sqs_queue.email_queue.arn
}

output "queue_name" {
  value = aws_sqs_queue.email_queue.name
}


output "dlq_url" {
  value = aws_sqs_queue.email_dlq.url
}

output "dlq_arn" {
  value = aws_sqs_queue.email_dlq.arn
}

output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}