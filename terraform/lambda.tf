resource "aws_lambda_function" "email_lambda" {

  function_name = "${var.project_name}-lambda"

  filename = "../lambda/lambda.zip"

  source_code_hash = filebase64sha256("../lambda/lambda.zip")

  role = aws_iam_role.lambda_role.arn

  handler = "lambda_function.lambda_handler"

  runtime = "python3.13"

  timeout = 30

  memory_size = 256

  tags = {
    Project = var.project_name
    Managed = "Terraform"
  }
}


resource "aws_lambda_event_source_mapping" "sqs_trigger" {

  event_source_arn = aws_sqs_queue.email_queue.arn

  function_name = aws_lambda_function.email_lambda.arn

  batch_size = 5

  enabled = true

}