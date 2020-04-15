terraform {
  backend "s3" {
    bucket = "hello-terraform123"
    key    = "remote_state.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "terraform-state"
  }
}
