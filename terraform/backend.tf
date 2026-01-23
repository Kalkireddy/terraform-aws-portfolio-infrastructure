terraform {
  backend "s3" {
    bucket         = "shiv-tf-state-992307"
    key            = "envs/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "shiv-terraform-locks"
    encrypt        = true
  }
}