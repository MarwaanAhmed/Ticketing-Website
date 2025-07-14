# IAM ROLE FOR LAMBDA

resource "aws_iam_role" "lambda_role" {
  name = var.function_name_iam_role
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

#IAM POLICY FOR LAMBDA

resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda_policy"
  description = "This policy will write into dynamodb table and create logs"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [

#STATEMENT FOR CLOUD WATCH LOGS
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
#STATEMENT FOR DYNAMODB WRITES
    {
            Action = "dynamodb:PutItem",
            Effect = "Allow"
            Resource = var.dynamodb_table_arn
     }
    ]
  })
}

#IAM POLICY ATTACHMENT

resource "aws_iam_role_policy_attachment" "lambda_attachment" {
  role       = aws_iam_role.lambda_role.arn
  policy_arn = aws_iam_policy.lambda_policy.arn
}

#LAMBDA FUNCTION

resource "aws_lambda_function" "lambda_function" {
  filename         = var.source_code_filename
  function_name    = var.function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "main.lambda_handler"
  source_code_hash = var.source_code_hash

  runtime = "python3.12"

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.database_table_name
    }
  }
  
}