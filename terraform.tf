terraform {
  required_version = "0.12.25"
  backend "s3" {
    encrypt = true
    region  = "us-east-2"
    bucket  = "gaming-cards-terraform-remotestate"
    key     = "gaming-cards/remote.tfstate"

    dynamodb_table = "gaming-cards-terraform-statelock"
  }
}