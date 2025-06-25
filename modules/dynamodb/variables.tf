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
