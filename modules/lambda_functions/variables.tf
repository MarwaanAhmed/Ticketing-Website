variable "database_table_name" {
  description = "The name of the DynamoDB table this function will access."
  type = string
  default = "ticketing_database"
}
