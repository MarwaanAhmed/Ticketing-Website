# IAM Role

resource "aws_iam_role" "lambda_function" {
  name = "TicketCreatorRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "Role allows Lambda to Create tickets into a database"
  }
}