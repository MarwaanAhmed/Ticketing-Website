resource "aws_apigatewayv2_api" "ticket_http_api" {
  name          = var.api_name
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "create_ticket_integration" {
  api_id           = aws_apigatewayv2_api.ticket_http_api.id
  integration_type = "AWS_PROXY"
  integration_uri  = var.lambda_arn
}