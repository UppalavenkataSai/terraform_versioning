# Data block to get default VPC
data "aws_vpc" "default" {
  default = true
}

# Security Group for EC2
resource "aws_security_group" "ec2_sg" {
  name        = "terraform-ec2-sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound"
  }

  tags = {
    Name = "TerraformDemoSG"
  }
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  key_name                    = var.ec2_key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<html>
                      <head>
                        <title>Uppala Venkata Sai Portfolio</title>
                        <style>
                          body { font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }
                          h1 { color: #2e6da4; }
                          h2 { color: #337ab7; }
                          p { font-size: 16px; line-height: 1.5; }
                          .skills { background-color: #d9edf7; padding: 10px; border-radius: 5px; }
                          .about { background-color: #fcf8e3; padding: 10px; border-radius: 5px; margin-top: 10px; }
                        </style>
                      </head>
                      <body>
                        <h1>Uppala Venkata Sai</h1>
                        <h2>AWS Cloud & DevOps Engineer</h2>
                        
                        <div class='about'>
                          <p>Hello! I am Uppala Venkata Sai, an enthusiastic AWS Cloud & DevOps engineer with a passion for building scalable, secure, and automated cloud solutions.</p>
                          <p>I enjoy learning new cloud technologies, automating infrastructure with Terraform, and deploying applications efficiently on AWS.</p>
                        </div>
                        
                        <div class='skills'>
                          <h3>Skills & Expertise:</h3>
                          <ul>
                            <li>AWS Cloud Services (EC2, S3, Lambda, RDS, VPC, IAM)</li>
                            <li>Infrastructure as Code (Terraform)</li>
                            <li>CI/CD Pipelines (Jenkins, GitHub Actions)</li>
                            <li>Containerization (Docker, Kubernetes basics)</li>
                            <li>Monitoring & Logging (CloudWatch, ELK stack)</li>
                          </ul>
                        </div>
                        
                        <p>Feel free to reach out to me for collaboration or any cloud-related discussions!</p>
                      </body>
                    </html>" > /var/www/html/index.html
              EOF


  tags = {
    Name = "TerraformDemoEC2"
  }
}

# Skip creating S3 bucket and DynamoDB table to reuse existing ones
# If you want to manage them later, uncomment and adjust names

# resource "aws_s3_bucket" "my_bucket" {
#   bucket = var.s3_bucket_name
#   tags = { Name = "TerraformDemoS3" }
# }

# resource "aws_s3_bucket_acl" "my_bucket_acl" {
#   bucket = aws_s3_bucket.my_bucket.id
#   acl    = "private"
# }

# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = var.dynamodb_table_name
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute { name = "LockID", type = "S" }
#   tags = { Name = "TerraformDemoDynamoDB" }
# }
