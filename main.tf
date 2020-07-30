provider "aws" {
  shared_credentials_file = var.shared_credentials_file
  region                  = var.region
  profile                 = var.profile
//  assume_role {
//    role_arn = var.role_arn
//  }
}

module "cognito" {
  source = "./modules/aws/cognito/user-pools"
  cognito_pool_name = var.cognito_pool_name
}

module "resource_server" {
  source = "./modules/aws/cognito/resource-servers"
  resource_server_id = var.resource_server_id
  resource_server_name = var.resource_server_name
  user_pool_id = module.cognito.user_pool_id

  custom_scope_1_desc = var.custom_scope_1_desc
  custom_scope_1_name = var.custom_scope_1_name
  custom_scope_2_desc = var.custom_scope_2_desc
  custom_scope_2_name = var.custom_scope_2_name
  custom_scope_3_desc = var.custom_scope_3_desc
  custom_scope_3_name = var.custom_scope_3_name
}

module "client" {
  source = "./modules/aws/cognito/clients"
  ogd_pool_id = module.cognito.user_pool_id
  user_pool_client_name = var.client_name

  custom_scope_1 = "${var.resource_server_id}/${var.custom_scope_1_name}"
  custom_scope_2 = "${var.resource_server_id}/${var.custom_scope_2_name}"
  custom_scope_3 = "${var.resource_server_id}/${var.custom_scope_3_name}"
}
