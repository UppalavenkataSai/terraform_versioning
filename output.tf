# output.tf
data "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
}

data "aws_dynamodb_table" "terraform_locks" {
  name = var.dynamodb_table_name
}

output "s3_bucket_name" {
  value = data.aws_s3_bucket.my_bucket.id
}

output "dynamodb_table_name" {
  value = data.aws_dynamodb_table.terraform_locks.name
}
