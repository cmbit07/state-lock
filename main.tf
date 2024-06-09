# Block-1: Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "ap-south-1"
}

resource "aws_s3_bucket" "s3_chandra" {
  bucket = "chandra-terraform-state"
}

resource "aws_dynamodb_table" "state_lock" {
  name         = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "LockID"
    Environment = "productions"
  }
}
resource "aws_instance" "ec2_example" {
  ami           = "ami-013e83f579886baeb"
  instance_type = var.instance_type
  tags = {
    Name = "Terraform EC2"
  }
}
