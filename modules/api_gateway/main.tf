resource "aws_apigatewayv2_api" "create_ticket_api" {
  name          = var.api_name
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "create_ticket_integration" {
  api_id           = aws_apigatewayv2_api.create_ticket_api.id
  integration_type = "AWS_PROXY"
  integration_uri  = var.lambda_arn
}

resource "aws_apigatewayv2_route" "create_ticket_route" {
  api_id    = aws_apigatewayv2_api.create_ticket_api.id
  route_key = "POST /tickets"

  target = "integrations/${aws_apigatewayv2_integration.create_ticket_integration.id}"
}

resource "aws_apigatewayv2_stage" "v1_stage" {
  api_id = aws_apigatewayv2_api.create_ticket_api.id
  name   = "v1"
  auto_deploy = true

  default_route_settings {
    throttling_burst_limit = 50
    throttling_rate_limit = 100
  }
}