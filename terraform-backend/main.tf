resource "aws_dynamodb_table" "example" {
  name             = "tictac_state_lock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"


  attribute {
    name = "LockID"
    type = "S"
  }

}

resource "aws_s3_bucket" "example" {
  bucket = "tictac-state-bucket"

  lifecycle {
    prevent_destroy = false
  }
}