resource "aws_cognito_user_pool" "ogd_user_pool" {
  name = "ogd-user-pool"

  admin_create_user_config {
    allow_admin_create_user_only = true
  }
}