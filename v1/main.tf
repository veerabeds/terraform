locals {
    lambda_name = "Data_Extraction"
    bucket_name = "Data_Entraction_Bucket"
}
data "archive_file" "python_zip" {
  type             = "zip"
  source_file      = "${path.module}/python/file.py"
  output_file_mode = "0666"
  output_path      = "${path.module}/python/file.zip"
}



resource "aws_lambda_function" "data_extraction_lambda" {
  runtime = "python3.9"
  filename         = data.archive_file.python_zip.output_path
  function_name    = local.lambda_name
  handler          = "file.lambda_handler"
  source_code_hash = data.archive_file.python_zip.output_base64sha256
  role             = aws_iam_role.lambda_role.arn
  memory_size = 1024
  timeout = 900
  environment {
    variables = {
      #incoming_bucket_arn = aws_s3_bucket.incoming.arn
    }
  }
  depends_on = [
      data.archive_file.python_zip,
      aws_iam_role.lambda_role
    ]
}

resource "aws_lambda_permission" "s3_permission_to_trigger_lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.data_extraction_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.data_bucket.arn
}

resource "aws_s3_bucket_notification" "data_bucket" {
  bucket = aws_s3_bucket.data_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.data_extraction_lambda.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "foldername"
    filter_suffix       = ".zip"
  }

  depends_on = [aws_lambda_permission.s3_permission_to_trigger_lambda]
}