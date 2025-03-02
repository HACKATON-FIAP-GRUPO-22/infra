terraform {
  backend "s3" {
    bucket = "fiap-fase05-tf"
    key    = "lambda/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.regionDefault
}

# Cognito Module
module "cognito" {
  source = "./cognito"
  region       = var.regionDefault
}

module "s3" {
  source = "./s3"
}

module "sqs" {
  source = "./sqs"
}


output "cognito_user_pool_id" {
  value = module.cognito.user_pool_id
}
