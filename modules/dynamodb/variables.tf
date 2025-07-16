variable "table_name"{
  description = "This is the Ticket table name"
  type = string
}

variable "hash_key"{
  description = "The name for out hash key"
  type = string
  }

  variable "gsi_name" {
    description = "name for the GSI table"
    type = string
    
  }

  variable "gsi_hash_key" {
    description = "The name for the GSI hash key"
    type = string
  }

  variable "gsi_range_key" {
    description = "the name for the GSI range key"
    type = string
    
  }

  variable "stream_enabled" {
    description = "This will determine whether the streams are enabled"
    type = bool
  }

  variable "stream_view_type" {
    description = "This will determine what stream view type will be logged"
    type = string
  }
