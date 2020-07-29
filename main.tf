provider "aws" {
  version = "2.33.0"
  region = "eu-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "ogd_cognito" {
  source = "./modules/aws/cognito/user-pools"
}

module "ogd_resource_server" {
  source = "./modules/aws/cognito/resource-servers"
  ogd_pool_id = module.ogd_cognito.ogd_user_pool_id
}

module "ogd_client" {
  source = "./modules/aws/cognito/clients"
  ogd_pool_id = module.ogd_cognito.ogd_user_pool_id
}
