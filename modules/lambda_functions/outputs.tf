output "lambda_function_arn" {
    description = "Outputing the ARN of the lambda function"
    value = aws_lambda_function.lambda_function.arn
}