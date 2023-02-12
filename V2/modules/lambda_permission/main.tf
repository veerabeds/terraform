resource "aws_lambda_permission" "this" {
  statement_id  = var.statement_id
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_source_arn
}

