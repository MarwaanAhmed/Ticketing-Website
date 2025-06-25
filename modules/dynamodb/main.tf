#Database
resource "aws_dynamodb_table" "ticket_table" {
name = var.table_name
billing_mode = "PAY_PER_REQUEST"
hash_key = var.hash_key

point_in_time_recovery {
  enabled = true  
}

attribute {
  name = "TicketID"
  type = "S"
}

}
