variable "bucket_id" {
    type = string
}
variable "lambda_function_arn" {
    type = string
}
variable "events" {
    type = list(string)
}
variable "filter_prefix" {
  type = string
}
variable "filter_suffix" {
  type = string
}
