terraform {
  required_version = ">= 0.13"
  backend "s3" {
  }
}

provider "aws" {
  region = "eu-west-1"
  version = "~> 2.0"
}

# Will include all modules and resources required for the feature/service
module "airflow-cluster" {
    source = "./module/airflow-cluster"
    tags = var.tags
}
