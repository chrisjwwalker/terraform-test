resource "aws_cognito_user_pool_client" "ogd_client_service" {
  name = "ogd-client-service"
  user_pool_id = var.ogd_pool_id

  allowed_oauth_flows = ["client_credentials"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes = ["openid"]

  generate_secret = true
}
