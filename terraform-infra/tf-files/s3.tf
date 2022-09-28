resource "aws_s3_bucket" "paas-cp" {
  bucket = "aws-crossplane-s3-remote-bucket"
  tags = {
    Name        = "arun"
    Environment = "Dev"
  }
}
      
resource "aws_s3_bucket_acl" "acl-test" {
       bucket = aws_s3_bucket.paas-cp.id
       acl    = "private"
}

terraform {
       backend "s3" {
        bucket = "aruntestings-1"
        key    = "s3-test-inline"
        region = "us-west-2"
        shared_credentials_file = "aws-creds.ini"
        workspace_key_prefix = "crossplane-test-remote"
       }
}