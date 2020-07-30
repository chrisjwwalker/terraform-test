resource "aws_cognito_resource_server" "resource_server" {
  identifier = var.resource_server_id
  name = var.resource_server_name

  scope {
    scope_description = var.custom_scope_1_desc
    scope_name = var.custom_scope_1_name
  }

  scope {
    scope_description = var.custom_scope_2_desc
    scope_name = var.custom_scope_2_name
  }

  scope {
    scope_description = var.custom_scope_3_desc
    scope_name = var.custom_scope_3_name
  }
  user_pool_id = var.user_pool_id
}