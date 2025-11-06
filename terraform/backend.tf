terraform {
  backend "s3" {
    bucket = "tictac-state-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tictac_state_lock"
    encrypt = true
  }
}