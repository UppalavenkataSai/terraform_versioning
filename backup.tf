terraform {
  backend "s3" {
    bucket         = "tf-prac-self"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "aws_dynamodb_table"  # existing table
    encrypt        = true
  }
}
