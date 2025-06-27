variable "table_name"{
  description = "This is the Ticket table name"
  type = string
  default = "ticketing-database"
}

variable "hash_key"{
  description = "The name for out hash key"
  type = string
  default = "TicketID"
  }

  variable "gsi_name" {
    description = "name for the GSI table"
    type = string
    default = "user-tickets-index"
  }

  variable "gsi_hash_key" {
    description = "The name for the GSI hash key"
    type = string
    default = "UserID"
  }

  variable "gsi_range_key" {
    description = "the name for the GSI range key"
    type = string
    default = "CreatedAt"
  }

  variable "stream_enabled" {
    description = "This will determine whether the streams are enabled"
    type = bool
    default = true
  }

  variable "stream_view_type" {
    description = "This will determine what stream view type will be logged"
    type = string
    default = "NEW_IMAGE"
  }
