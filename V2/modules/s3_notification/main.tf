resource "aws_s3_bucket_notification" "this" {
  bucket = var.bucket_id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = var.events
    filter_prefix       = var.filter_prefix
    filter_suffix       = var.filter_suffix
  }

}


