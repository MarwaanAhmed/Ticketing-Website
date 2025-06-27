#Database
resource "aws_dynamodb_table" "ticket_table" {
name = var.table_name
billing_mode = "PAY_PER_REQUEST"
hash_key = var.hash_key

point_in_time_recovery {
  enabled = true  
}

attribute {
  name = var.hash_key
  type = "S"
}

attribute {
  name = var.gsi_hash_key
  type = "S"
}

attribute {
  name = var.gsi_range_key
  type = "S"
}

stream_enabled = var.stream_enabled
stream_view_type = var.stream_view_type

 global_secondary_index {
    name               = var.gsi_name
    hash_key           = var.gsi_hash_key
    range_key          = var.gsi_range_key
    projection_type    = "ALL"
  }

tags = {
  Project = "scalable-ticketing-website"
  ManagedBy = "Terraform" 
}

}