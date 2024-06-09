terraform {
  backend "s3" {
    bucket         = "chandra-terraform-state"
    key            = "terraform.tfsate"
    region         = "ap-south-1"
    dynamodb_table = "LockID"
  }
}
