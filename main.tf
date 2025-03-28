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

module "cognito" {
  source = "./cognito"
  region = var.regionDefault
}

module "s3" {
  source = "./s3"
}

module "sqs" {
  source = "./sqs"
}

module "rds" {
  source = "./rds"
}

module "k8s" {
  source = "./k8s"
}

