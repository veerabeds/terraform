module "data_s3_bucket"{
  count = 0
  source = "./modules/s3"
  bucket_name = var.bucket_name
  acl = var.acl
  version_enabled = var.version_enabled
}
data "aws_s3_bucket" "selected" {
  bucket = var.bucket_name
}
module "lambda_data_extraction" {
  source = "./modules/lambda"
  lambda_name = var.lambda_name
  runtime = var.runtime
  filename = data.archive_file.python_zip.output_path
  handler = var.handler
  iam_role = aws_iam_role.lambda_role.arn
  source_code_hash = data.archive_file.python_zip.output_base64sha256
  memory_size = 1024
  timeout = 900
  depends_on = [
      data.archive_file.python_zip,
      aws_iam_role.lambda_role
    ]
}

module "s3_permission_lambda" {
  source = "./modules/lambda_permission"
  statement_id = "AllowExecutionFromS3Bucket"
  function_name = module.lambda_data_extraction.arn
  s3_bucket_source_arn = module.data_s3_bucket.arn
}


module "data_s3_bucket_trigger" {
  source = "./modules/s3_notification"
  bucket_id = module.data_s3_bucket.id
  lambda_function_arn = module.lambda_data_extraction.arn
  events = ["s3:ObjectCreated:*"]
  filter_prefix = "foldername"
  filter_suffix = ".zip"
  depends_on = [module.s3_permission_lambda]
} 
  
