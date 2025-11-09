# terraform_versioning
# terraform_versioning
Terraform Infrastructure Demo

This repository contains Terraform code to provision a basic infrastructure for demo purposes. The infrastructure includes:

Amazon S3: For storing versioned files.

DynamoDB: Used for state locking and tracking.

EC2: A demo server instance launched in your portfolio project.

Project Structure
.
├── main.tf           # Main Terraform configuration
├── variables.tf      # Input variables
├── outputs.tf        # Output values
├── provider.tf       # Provider configuration (AWS)
├── terraform.tfvars  # Example variable values
└── README.md         # Project documentation

Features

Versioned S3 bucket for storing files.

DynamoDB table for Terraform state locking.

EC2 instance for demonstration purposes.

Infrastructure is modular and reusable.

