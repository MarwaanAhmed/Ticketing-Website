module "dynamodb" {
  source = "./modules/dynamodb"
 }


data "archive_file" "create_ticket_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src/create_ticket"
  output_path = "${path.module}/dist/create_ticket.zip"
  }


module "create_ticket_lambda_function" {
  source = "./modules/lambda_functions"
  function_name = "create_function"
  dynamodb_table_name = module.dynamodb.table_name
  source_code_filename = data.archive_file.create_ticket_zip.output_path
  source_code_hash     = data.archive_file.create_ticket_zip.output_base64sha256
}