    dynamodb_table = "terraform-locks"
    bucket = "krang-dev-terraform-state"
    key = "global/s3/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
    