resource "aws_cognito_user_pool_client" "client_service" {
  name = var.user_pool_client_name
  user_pool_id = var.ogd_pool_id

  allowed_oauth_flows = ["client_credentials"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes = [var.custom_scope_1, var.custom_scope_2, var.custom_scope_3]

  generate_secret = true
}
