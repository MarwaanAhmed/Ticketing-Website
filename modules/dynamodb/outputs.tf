output "table_name" {
  description = "The name of the DynamoDB table."
  value       = aws_dynamodb_table.ticket_table.name
}

output "table_arn" {
  description = "this will output the ARN of the dynamodb table"
  value       = aws_dynamodb_table.ticket_table.arn
}