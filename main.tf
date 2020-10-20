terraform {
  required_version = ">= 0.13"
  backend "s3" {
  }
}

provider "aws" {
  region = "eu-west-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

module "airflow-cluster" {
    source = "./module/airflow-cluster"
    tags = var.tags
}
