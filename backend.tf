terraform {
  backend "s3" {
    bucket         = "your-tfstate-bucket"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
  }
}