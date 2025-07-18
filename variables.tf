# DYNAMODB VARIABLES
variable "database_name" {
  description = "The name for the main tickeitng database"
  type        = string
  default     = "Ticketing-database"
}

variable "database_hash_key" {
    description = "The name for out hash key for the main ticketing database"
    type = string
    default = "TicketID"
}

variable "database_gsi" {
    description = "name for the GSI table for the main database"
    type = string
    default = "user-tickets-index"
}

variable "database_gsi_range_key" {
    description = "the name for the GSI range key for the main database"
    type = string
    default = "UserID" 
}

variable "database_gsi_hash_key" {
    description = "The name for the GSI hash key for the main database"
    type = string
    default = "EventID"
}

variable "database_stream_enabled" {
    description = "This will determine whether the streams are enabled"
    type = bool
    default = true
  }

  variable "database_stream_view_type" {
    description = "This will determine what stream view type will be logged for the main ticketing database"
    type = string
    default = "NEW_IMAGE"
    
  }

  # LAMBDA VARIABLES

  variable "create_ticket_function_name" {
    description = "Name for the creat ticket Function name."
    type = string
    default = "create_ticket"
    
  }

  # API GATEWAY VARIABLE

  variable "api_name" {
    description = "the name for the api gateway for the ticketing website"
    type = string
    default = "ticketing-api"
  }

