resource "aws_cognito_user_pool" "user_pool" {
  name = var.cognito_pool_name

  admin_create_user_config {
    allow_admin_create_user_only = true
  }
}