resource "aws_lambda_function" "this" {
  runtime = var.runtime
  filename         = var.filename
  function_name    = var.lambda_name
  handler          = var.handler
  source_code_hash = var.source_code_hash
  role             = var.iam_role
  memory_size = var.memory_size
  timeout = var.timeout
  environment {
    variables = {
      #incoming_bucket_arn = aws_s3_bucket.incoming.arn
    }
  }
  
}

