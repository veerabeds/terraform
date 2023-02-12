#S3 Bucket
bucket_name = "Data_Entraction_Bucket"
acl = "private"

#Lambda Function
lambda_name = "Data_Extraction"
runtime = "python3.9"
handler = "file.lambda_handler"
layers = ["arn:aws:lambda:us-east-1","arn:aws:lambda:us-east-1"]
variables_env = {
  ALLOCATIONS_KEY = "value",
  AVAILS_KEY = "value",
  INVENTOTY_KEY = "value",
  S3_BUCKET = "value"

}


