variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_ami" {
  description = "AMI ID for EC2"
  type        = string
  default     = "ami-0305d3d91b9f22e84"
}

variable "ec2_key_name" {
  description = "Key pair name for EC2"
  type        = string
  default     = "mumbai-keypair"
}

variable "s3_bucket_name" {
  description = "Name of S3 bucket"
  type        = string
  default     = "tf-prac-self"
}

variable "dynamodb_table_name" {
  description = "Name of DynamoDB table for state locking"
  type        = string
  default     = "aws_dynamodb_table"
}
