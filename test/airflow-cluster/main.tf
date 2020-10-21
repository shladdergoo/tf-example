terraform {
  required_version = ">= 0.13"
  backend "s3" {
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.0"
}

# Skeleton implementation that allows the individual module to be deployed and tested
module "airflow-cluster" {
  source = "../../module/airflow-cluster"
  tags = {
    Name        = "jf-test-moduletest"
    environment = "moduletest"
    live        = "no"
  }
}
