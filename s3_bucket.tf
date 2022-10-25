# Made an AWS Account and IAM user to get these credentials. Could pass it in as a secret 
# Not sure if I need to for this assessment.
provider "aws" {
    region = "us-east-1"
    access_key = "AKIAQIUTVK6BORHOPVYA"
    secret_key = "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"
}

# Create an S3 bucket
resource "aws_s3_bucket" "michael-s3bucket-forcargomatic" {    
    bucket = var.bucket_name
    acl    = "private" 
    tags = {

        Name        = "My bucket"
        Environment = "Master"

    }

}

# Blocking public accesss for my S3 bucket
resource "aws_s3_bucket_public_access_block" "blocking-public-access" {
  bucket = var.bucket[0].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#Disabling versioning for my S3 bucket
resource "aws_s3_bucket_versioning" "versioning_configuration" {
  bucket = var.bucket[0].id
  versioning_configuration {
    status = "Disabled"
  }
}

# Uploading a text file to S3 through terraform as an example
resource "aws_s3_bucket_object" "object" {
  bucket = var.bucket[0].id
  key    = "profile"
  acl    = "private"  # or can be "public-read"
  source = "/Users/test/terraform/testfile.txt"
  etag = filemd5("/Users/test/terraform/testfile.txt")

}
