#S3
variable "bucket_name" {
  type = string
}
variable "acl" {
  type = string
}
variable "version_enabled" {
  type = bool
  default = true
}


#Lambda
variable "runtime" {
  type = string
}
variable "lambda_name" {
  type = string
}
# variable "filename" {
#     type = string
# }
variable "handler" {
    type = string
}
variable "layers" {
  type = list(string)
}
variable "variables_env" {
  type = map(string)
}
# variable "iam_role" {
#     type = string
# }
# variable "memory_size" {
#     type = number
# }
# variable "timeout" {
#     type = number
# }