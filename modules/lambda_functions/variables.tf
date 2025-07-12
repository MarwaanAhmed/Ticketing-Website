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