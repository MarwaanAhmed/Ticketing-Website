variable "database_table_name" {
  description = "The name of the DynamoDB table this function will access."
  type = string
  default = "ticketing_database"
}

variable "function_name_iam_role" {
  description = "This is the name for my IAM role"
  type = string
  default = "TicketCreatorRole"
  
}

variable "dynamodb_table_arn" {
  description = "The ARN for my DynamoDB table"
  type = string
  default = ""
  
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for the Lambda to access."
  type        = string
}

variable "function_name" {
  description = "A unique name for the Lambda function and its associated resources."
  type        = string
}