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
    default = "gsi-ticketing-databse"
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
