resource "aws_cognito_resource_server" "ogd_resource_server" {
  identifier = "https://example.com"
  name = "ogd_resource_server"

  scope {
    scope_description = "test scope"
    scope_name = "ogd:test"
  }

  user_pool_id = var.ogd_pool_id
}