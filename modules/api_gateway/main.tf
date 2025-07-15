resource "aws_apigatewayv2_api" "ticket_http_api" {
  name          = var.api_name
  protocol_type = "HTTP"
}