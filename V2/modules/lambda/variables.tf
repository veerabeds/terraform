variable "runtime" {
  type = string
}
variable "lambda_name" {
  type = string
}
variable "filename" {
    type = string
}
variable "handler" {
    type = string
}
variable "iam_role" {
    type = string
}
variable "memory_size" {
    type = number
}
variable "timeout" {
    type = number
}
variable "source_code_hash" {
    type = string
}
variable "layers" {
    type = list(string)
}
variable "variables_env" {
    type = map(string)
}
