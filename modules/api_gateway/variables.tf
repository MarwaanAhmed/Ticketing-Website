variable "api_name" {
  description = "the name for the http api"
  type = string
}

variable "lambda_arn" {
  description = "The ARN of the Lambda function to be triggered."
  type = string
}