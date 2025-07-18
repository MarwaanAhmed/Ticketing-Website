output "api_endpoint" {
    description = "The invoke URL for the deployed API stage"
    value = aws_apigatewayv2_stage.v1_stage.invoke_url
}

output "execution_arn" {
    description = "This is the execution ARN. Will be used by lambda"
    value = aws_apigatewayv2_api.create_ticket_api.execution_arn
}