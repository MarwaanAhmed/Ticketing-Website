module "dynamodb" {
  source = "./modules/dynamodb"
  table_name = var.database_name
  hash_key = var.database_hash_key
  gsi_name = var.database_gsi
  gsi_range_key = var.database_gsi_range_key
  gsi_hash_key = var.database_gsi_hash_key
  stream_enabled = var.database_stream_enabled
  stream_view_type = var.database_stream_view_type
 }


data "archive_file" "create_ticket_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src/create_ticket"
  output_path = "${path.module}/dist/create_ticket.zip"
  }


module "create_ticket_lambda_function" {
  source = "./modules/lambda_functions"
  function_name = var.create_ticket_function_name
  dynamodb_table_name = module.dynamodb.table_name
  dynamodb_table_arn  = module.dynamodb.table_arn
  source_code_filename = data.archive_file.create_ticket_zip.output_path
  source_code_hash     = data.archive_file.create_ticket_zip.output_base64sha256
}

module "api_gateway" {
  source = "./modules/api_gateway"
  api_name = var.api_name
  lambda_arn = module.create_ticket_lambda_function.lambda_function_arn
}